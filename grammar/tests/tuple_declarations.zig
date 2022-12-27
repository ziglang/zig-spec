const KV = struct {
    /// foo
    comptime []const u8 = 1,
    isize,
    b: u32,
    // needs to be wrapped in parentheses to not be parsed as a function decl
    (fn () void) align(1),

    fn foo() void {}
};
