#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

impl Rectangle {
    fn area(&self) -> u32 {
       self.width * self.height
    }
}

impl Rectangle {
    fn width(&self) -> bool {
       self.width > 0
    }
}

impl Rectangle {
    fn square(size: u32) -> Self {
        Self {
            width : size,
            height: size,
        }
    }
}

fn main() {
    let rect1 = Rectangle {
        width: 30,
        height: 50,
    };

    if rect1.width() {
        println!(
            "The area of the rectangle is {} square pixels",
            rect1.area()
        );
    }
}
