#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

fn main() {
    let width1 = 30;
    let height1 = 50;

    println!("The area of the rectangle eis {} square pixels ",
             area(width1, height1));

    //  Refactoring with Tuples

    let rect1:(u32, u32) = (30, 50);
    println!("The area of the rectangle eis {} square pixels ",
             area_1(rect1));
    // Refactoring with Structs: Adding More Meaning
    let rect2 = Rectangle {
        width: 30,
        height: 50,
    };

    println!("The area of the rectangle eis {} square pixels ",
             area_2(&rect2));

   // Adding Useful Functionality with Derived Traits
    println!("Print rect {:?} square pixels ", rect2);

}

fn area(width: u32, height: u32) -> u32 {
    width * height
}

fn area_1(dimensions: (u32, u32)) -> u32 {
   dimensions.0 * dimensions.1
}

fn area_2(rectangle: &Rectangle) -> u32 {
    rectangle.width * rectangle.height


}
