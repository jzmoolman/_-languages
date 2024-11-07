mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
        fn seat_at_table() {}
    }

    mod serving {
        fn take_order() {}
        fn serve_order() {}
        fn take_payment() {}
    }
}

mod back_of_house {
    pub struct Breakfast {
        pub toast: String,
        seasonal_fruit: String,
    }
    
    impl Breakfast {
        pub fn summer(toast: &str) -> Breakfast {
            toast: Stiring::from(toast);
            season_fruit: String::from("peaches"),
            
        }
    }

    fn fix_incorrect_oder() {
        cook_order();
        super::deliver_order();
        crate::deliver_order();
    }

    fn cook_order() {}
}

fn deliver_order() {}

pub fn eat_at_restaurant() {
    crate::front_of_house::hosting::add_to_waitlist();

    front_of_house::hosting::add_to_waitlist();
}

pub fn eat_at_restaurant() {
    let mut meal =  back_of_house::Breakfast::summer("Rye");
    meal.toat = String::from("Wheat");
    println!("I'd like {} toast please", meal.toast);
}
