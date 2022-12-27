//! This is a container doc comment
// This is a comment between the container doc comments
//! That spans multiple lines

const MyStruct = struct {
    //! This is a container doc comment inside a struct

    /// And this is a doc comment
    a: u32,

    /// This is another doc comment
    b: i32,

    /// And one more field
    // A regular comment
    /// Followed by another doc comment
    c: f32,
};

/// This is MyEnum
const MyEnum = enum {
    //! It has some fields

    /// This is Foo
    Foo,
    /// This is Bar
    Bar,
};

/// This is a doc comment for the error block
const Errors = error {
    /// This documents MyError1
    MyError1,
    /// This documents MyError2
    MyError2,
};

/// This is an add function
/// It adds two numbers
pub fn add(
    /// a is the first number
    a: u32,
    /// b is the second number
    b: u32) u64 {
    const mystruct = struct {
        /// c is a float
        c: f64,
    };
    return a + b;
}

/// foo is a a number
const foo = 5;
