enum IpAddrKind {
    V4,
    V6,
}

struct IpAddr {
    kind: IpAddrKind,
    address: String,
}

enum IpAddrV2 {
    V4(String),
    V6(String),
}

enum IpAddrV3 {
    V4(u8, u8, u8, u8),
    V6(String),
}

enum Message {
    Quit,
    Move {x: i32, y: i32},
    Write(String),
    ChangeColor(i32, i32, i32),

}

impl Message {
    fn call(&self) {

    }

}

// enum Option<T> {
//     None, 
//     Some(T),
// }

fn main() {
    println!("Hello, world!");
        
    let home = IpAddr {
        kind: IpAddrKind::V4,
        address: String::from("127.0.0.1"),
    };

    let loopback = IpAddr {
        kind: IpAddrKind::V6,
        address: String::from("::1"),
    };

    let home = IpAddrV2::V4(String::from("127.0.0.1"));
    let loopback = IpAddrV2::V6(String::from("::1"));


    let home = IpAddrV3::V4(127, 0, 0, 1);
    let loopback = IpAddrV2::V6(String::from("::1"));

    let message = Message::Quit;
    message.call();

    // Option
    let some_number = Some(5);
    let some_char = Some('e');
    let absent_numner:Option<i32> = None;

    let x: i8 = 5;
    let y : Option<i8> = Some(5);

    let sum = x + y;
    






    
}
