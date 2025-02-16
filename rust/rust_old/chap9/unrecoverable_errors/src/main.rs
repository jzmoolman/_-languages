use std::fs::File;
use std::io::{self, Read,ErrorKind};

fn main() {
    println!("Hello, world!");
    // panic!("Crash and burn");
    
    //Using a panic! Backtrace

    //let v = vec![1,2,3];
    //v[99];

    // Recoverable Errors with Result

    // let greeting_file_result = File::open("hello.txt");
    // let greeting_file = match greeting_file_result
    // {
    //     Ok(file) => file,
    //     Err(error) => panic!("Problem opening the file: {:?} ", error),
    // };

    // Matching on Different Errors 
    
    // let greeting_file_result = File::open("hello.txt");
   
    // let greeting_file = match greeting_file_result {
    //     Ok(file) => file,
    //     Err(error) => match error.kind() {
    //         ErrorKind::NotFound => match File::create("hello.txt") {
    //             Ok(fc) => fc,
    //             Err(e) => panic!("Problem creating file {:?}", e),
    //         },
    //         other_error => {
    //             panic!("Problem open the file {:?}", other_error);
    //         }


    //     },
    // };


    let greeting_file = File::open("hello.txt").unwrap_or_else(|error| {
        if error.kind() == ErrorKind::NotFound {
            File::create("hello.txt").unwrap_or_else(|error| {
                panic!("Problem creating file {:?}", error);
            })
        } else {
            panic!("Problem open the file {:?}", error);
        }

    });

// Propagating Errors





}


fn read_username_from_file() -> Result<String, io::Error> {
    let username_file_result = File::open("hello.txt");
    let mut username_file = match username_file_result {
        Ok(file) => file,
        Err(e) => return Err(e),
    };
    let mut username = String::new();
    match username_file.read_to_string(&mut username) {
        Ok(_) => Ok(username),
        Err(e) => Err(e),
    }
}

fn read_username_from_fileV2() -> Result<String, io::Error> {
    let mut username_file = File::open("hello.txt")?;
    let mut username = String::new();
    username_file.read_to_string(&mut username)?; 
    Ok(username)
}