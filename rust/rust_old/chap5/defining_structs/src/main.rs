struct User {
    active: bool,
    username: String,
    email: String,
    sign_in_count: u64,
}

struct Color(i32, i32, i32);
struct Point(i32, i32, i32);
struct AlwaysEqual;

fn main() {
    println!("Hello, world!");

    let user1 = User {
        active: true,
        username: String::from ("username"),
        email: String::from("email"),
        sign_in_count: 1,
    };

    let mut user1 = User {
        active: true,
        username: String::from ("username"),
        email: String::from("email"),
        sign_in_count: 1,
    };

    user1.username = String::from("usermame2");
    
    // Creating Instances from Other Instances with Struct Update Syntax
    let mut user2 = User {
        email: String::from("email@2"),
        ..user1
    };


    // Using Tuple Structs Without Named Fields to Create Different Types

    let black = Color(0,0,0);
    let origin = Point(0,0,0);

    // Unit-Like Structs Without Any Fields
    let subject = AlwaysEqual;
    
    // Ownership of Struct Data
    


}

fn built_user(email: String, username:String)-> User {
    User {
        active: true,
        username: username,
        email: email,
        sign_in_count: 1,
    }

}

fn built_userv2(email: String, username:String)-> User {
    User {
        active: true,
        username,
        email,
        sign_in_count: 1,
    }

}