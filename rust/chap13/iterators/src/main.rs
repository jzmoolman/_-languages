fn main() {
    println!("Hello, world!");

    let v1 = vec![1, 2, 3];
    let v1_iter = v1.iter();

    for val in v1_iter { 
        println!("Got:  {}", val);
    }

    let v2: Vec<_> = v1.iter().map(|x| x + 1).collect();

    for val in v2.iter() { 
        println!("Got:  {}", val);
    }

}
