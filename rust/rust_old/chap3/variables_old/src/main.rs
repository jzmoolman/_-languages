fn main() {
    let x = 5;
    let x = x + 1;
    {
        let x = x * 2;
        println!("The value of x is: {x}");
    }
    println!("The value of x is: {x}");

    let tup: (i32, f64, char) = (1, 0.5, 'z');
    let y = tup.1;
    println!("The value of y is {y}");
    
    let a: [i32, 5] = [1,2,3,4,5];
    
    
}
