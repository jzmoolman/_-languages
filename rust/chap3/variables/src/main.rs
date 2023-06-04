

const THREE_IN_SECONDS: u32 = 60*60*3;

fn main() {
    let mut x = 5;
    println!("The value x is: {x}");
    x = 6;
    println!("The value x is: {x}");

   // shadowing varibales
   let x = 5;
   let x= x+1;
   {
        let x = x * 2;
        println!("The value x in scope is: {x}");

   }
   println!("The value x after scope is: {x}");


}
