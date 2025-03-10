mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}

        pub fn seat_at_table() {}
    }

    mod serving {
        fn take_order() {}
    
        fn serve_order() {}
   
        fn take_payment() {}
    }
}

pub fn eat_at_restaurant() {
    crate::front_of_house::hosting::add_to_waitlist();

    front_of_house::hosting::add_to_waitlist();
}

fn deliver_order() {}

mod back_of_house {
    fn fix_incorrect_order(){
        cook_order();
        super::deliver_order();
    }

    fn cook_order() { }

    pub struct Breakfast {
        pub toast: String,
        seasonal_fruit: String,
    }
    pub enum Appetizer {
        Soup,
        Salad,
    }

    impl Breakfast {
        pub fn summer(toast: &str) -> Breakfast {
            Breakfast { 
                toast: String::from(toast),
                seasonal_fruit: String::from("peaches"),
            }
        } 
        
    }
}


pub fn eat_at_restaurant() {
    // Order a breakfast in the summer with Rye toast
    let mut meal = back_of_house::Breakfast::summer("Rye");
    // Change our mind about what bread we'd like
    meal.toast = String::from("Wheat");
    println!("I'd like {} toast please", meal.toast);

    // The next line won't compile if we uncomment it; we're not allowed
    // to see or modify the seasonal fruit that comes with the meal
    // meal.seasonal_fruit = String::from("blueberries");
}


pub fn eat_at_restaurantV2() {
    let order1 = back_of_house::Appetizer::Soup;
    let order2 = back_of_house::Appetizer::Salad;
}

use front_of_house::hosting::add_to_waitlist;

use crate::front_of_house::hosting;

pub fn eat_at_restaurantV3() {
    add_to_waitlist();

}

mod custormer {
    pub fn eat_at_restaurant () {
        super::add_to_waitlist()
    }
}
