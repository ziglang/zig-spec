pub const AbsolutePointerModeAttributes = packed struct(u32) {
    supports_alt_active: bool,
    supports_pressure_as_z: bool,
    _pad: u30 = 0,
};
