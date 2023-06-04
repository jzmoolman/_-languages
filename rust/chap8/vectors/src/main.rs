fn main() {
    println!("Hello, world!");

    let v : Vec<i32> = Vec::new();
    let v = vec![1,2,3];

    let mut v : Vec<i32> = Vec::new();
    v.push(5);
    v.push(6);
    v.push(7);
    v.push(8);

    let v = vec![1,2,3,4,5];
    let third: &i32 = &v[2];
    println!("The third element is {third}");


    let third: Option<&i32> = v.get(2);
    match third {
        Some(value) => println!("The third element is {value}"),
        None => println!("There is no third element."),
    }

    let mut v = vec![1, 2, 3, 4, 5];
    {
        let first = &v[0];
        println!("The first element is: {first}");
    }

    v.push(6);

    let v = vec![100, 32, 57];
    for i in &v {
        println!("{i}");
    }

    let mut v = vec![100, 32, 57];
    for i in &mut v {
        *i += 50;
    }
    for i in &v {
        println!("{i}");
    }

    enum SpreadSheetCell {
        Int(i32),
        Float(f64),
        Text(String),
    }

    let row = vec![
        SpreadSheetCell::Int(3),
        SpreadSheetCell::Float(10.12),
        SpreadSheetCell::Text(String::from("Blue")),
    ];

    for cell in &row {
        match cell {
            SpreadSheetCell::Int(value) => println!("Int {value}"),
            SpreadSheetCell::Float(value) => println!("Float {value}"),
            SpreadSheetCell::Text(value) => println!("Text {value}"),
        }
    }




}
