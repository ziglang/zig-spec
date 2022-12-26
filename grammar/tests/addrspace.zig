test {
    const y: *allowzero align(8) addrspace(.generic) const volatile u32 = undefined;
    _ = y;
}
