const std = @import("std");
const expect = std.testing.expect;

const SliceTypeA = extern struct {
    len: usize,
    ptr: [*]u32,
};
const SliceTypeB = extern struct {
    ptr: [*]SliceTypeA,
    len: usize,
};
const AnySlice = union(enum) {
    a: SliceTypeA,
    b: SliceTypeB,
    c: []const u8,
    d: []AnySlice,
};

fn withSwitch(any: AnySlice) usize {
    return switch (any) {
        inline .a => {},
        // With `inline else` the function is explicitly generated
        // as the desired switch and the compiler can check that
        // every possible case is handled.
        inline else => |slice, tag| slice.len,
    };
}

test "inline else" {
    var any = AnySlice{ .c = "hello" };
    try expect(withSwitch(any) == 5);
}
