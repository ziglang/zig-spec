/// This is doc comment is ok
pub fn add(a: u32, b: u32) u64 {
    /// This is a doc comment, but it's not allowed here
    var sum = a + b;
    return sum;
}
