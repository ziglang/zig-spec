// always require types on fields in structs
const T = struct { a };

// don't allow types to be specified here
const E = enum { a: u32, b };

// always require types on fields in bare unions
const U1 = union { a }; 

// types may be present or omitted in unions with explicit tag but not tag assigments
const U2 = union(E) { a: u32 = 0, b };

// types may be present or omitted in unions with implicit tag and tag assigments are ok
const U3 = union(enum) { a: u32 = 0, b };