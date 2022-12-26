// A doc-comment followed by a line-comment is not supported by grammar.y.
const S = struct {
    //! doc
    /// doc
    // doc
    a: i32,
};
