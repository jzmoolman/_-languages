#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

fn main() {
    println!("Hello, world!");
    let width1 = 30;
    let height1 = 50;

    println!(
        "The area of the rectangle is {} square pixels.", 
        area(width1, height1)
    );
    // Refactoring with Tuples
    let rect = (30, 50);

    println!(
        "The area of the rectangle is {} square pixels.", 
        areav2(rect)
    );

    // Refactoring with Structs: Adding More Meaning
    let rect1= Rectangle {
        width: 30,
        height: 50,
    };


    println!(
        "The area of the rectangle is {} square pixels.", 
        areav3(&rect1)
    );

    // Adding Useful Functionality with Derived Traits

    println!("rect1: {:?}", rect1);



    // debug 
    let scale = 2;
    let rect1 = Rectangle {
        width: dbg!(30 * scale),
        height: 50,
    };

    dbg!(&rect1);

}

fn area(width: u32, height: u32) -> u32 {
    width * height
}

fn areav2(dim: (u32,u32)) -> u32 {
    dim.0 * dim.1
}

fn areav3(rectangle: &Rectangle) -> u32 {
    rectangle.width * rectangle.height
}