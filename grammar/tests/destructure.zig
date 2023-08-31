test "destructure" {
    var x: u32 = undefined;
    x, var y: u32, const z = .{ 1, 2, 3 };
    _ = y;
    _ = z;
}

test "destructure to lvalues as conditional body" {
    var x: u32 = undefined;
    var y: u32 = undefined;

    if (true) x, y = .{ 1, 2 };
    while (false) y, x = undefined;
}
