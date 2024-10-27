enum IpAddrKind {
    V4,
    V6,
}

struct IpAdd {
    kind: IpAddrKind,
    address: String,
}

fn main() {
    println!("Hello, world!");
}
