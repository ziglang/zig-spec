test {
    var a: isize = 10;

    a +|= 1;
    a -|= 1;
    a *|= 1;
    a <<|= 1;

    const b: isize = a +| 1;
    const c: isize = b -| 1;
    const d: isize = c *| 1;
    const e: isize = d <<| 1;
    _ = e;
}
