use std::fs::File;
use std::io::ErrorKind;

fn main() {
    println!("App: Errors");
    let greeting_file_result = File::open("Hello.txt");

    let _greeting_file = match greeting_file_result {
        Ok(file) => file,
        // Err(error) => panic!("Panic opening the file: {:?}", error),
        Err(error) => match error.kind() {
            ErrorKind::NotFound => match File::create("Hello.txt") {
                Ok(fc) => {
                    println!("Creating new file: Hello.txt");
                    fc
                }
                Err(e) => panic!("Panic creating the file: {:?}", e),
            },
            other_error => {
                panic!("Panic opeing the file: {:?}", other_error);
            }
        },
    };
}
