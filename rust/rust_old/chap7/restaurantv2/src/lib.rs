
mod front_of_house;
// mod back_of_house;

pub use crate::front_of_house::hosting;

// fn deliver_order() {}

pub fn eat_at_restaurant() {
    hosting::add_to_waitlist();
    crate::front_of_house::hosting::add_to_waitlist();
}

// pub fn eat_at_restaurantV2() {
//     // Order a breakfast in the summer with Rye toast
//     let mut meal = back_of_house::Breakfast::summer("Rye");
//     // Change our mind about what bread we'd like
//     meal.toast = String::from("Wheat");
//     println!("I'd like {} toast please", meal.toast);

//     // The next line won't compile if we uncomment it; we're not allowed
//     // to see or modify the seasonal fruit that comes with the meal
//     // meal.seasonal_fruit = String::from("blueberries");
// }


// pub fn eat_at_restaurantV3() {
//     let order1 = back_of_house::Appetizer::Soup;
//     let order2 = back_of_house::Appetizer::Salad;
// }

// use front_of_house::hosting::add_to_waitlist;

// use crate::front_of_house::hosting;

// pub fn eat_at_restaurantV4() {
//     add_to_waitlist();

// }

// mod custormer {
//     pub fn eat_at_restaurant () {
//         super::add_to_waitlist()
//     }
// }
