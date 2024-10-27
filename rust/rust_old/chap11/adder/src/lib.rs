pub fn add(left: usize, right: usize) -> usize {
    left + right
}

pub fn add_two(a: i32) -> i32 {
    a + 2
}

#[cfg(test)]
mod tests {
    use super::*;

    // #[test]
    // fn exploration() {
    //     // let result = add(2, 2);
    //     assert_eq!(2+2, 4);
    // }

    // #[test]
    // fn another() {
    //     panic!("Make this test fail");

    // }
    #[test]
    fn it_adds_two() {
        assert_eq!(4, add_two(2));

    }
}
