# Disorganized Facts About Zig

Please not that this document may contain outdated, incomplete, or incorrect information.  It is purely for organization purposes and is still undergoing heavy editing.

The term "This Document" should be interpreted as referring to the eventual spec that this turns into, not this scratchpad.

## About This Document

This specification describes the details of the Zig Language, as well as anything adjacent to it that would be required to build a Compiler for Zig.  While this document does contain the complete details of the Zig language, it may not be a very good resource for learning the language.  Topics may be introduced out of order, and in significantly more detail than is necessary to write functioning Zig code.

Please note also that this document (and the zig language itself) is a work in progress.  As a result, it may contain outdated, incomplete, or incorrect information.

## Definitions

### Invalid Zig

There are four ways in which Invalid Zig code can manifest.  Invalid Zig must always fall into one of these four categories.

#### Parse Error

Parse Errors are guaranteed to cause a compilation failure if the compiler attempts to read the file, regardless of whether the invalid code is actually compiled or executed at compile time.

#### Compile Error

Compile Errors are guaranteed to cause a compilation failure if and only if the code is compiled or executed at comptime.

#### Checked Illegal Behavior

If checked illegal behavior occurs during comptime execution, it manifests as a Compile Error.  Otherwise, if the program is being compiled with safety checks enabled, Checked Illegal Behavior manifests as a Panic at runtime.  If the program is being compiled with safety checks disabled, Checked Illegal Behavior at runtime is equivalent to Unchecked Illegal Behavior.

#### Unchecked Illegal Behavior

Any Zig program which executes Unchecked Illegal Behavior is by definition ill-formed.  No guarantees are made by this specification about the execution of a program that triggers Unchecked Illegal Behavior, even before the behavior occurs.  Note that Zig has been designed so that Unchecked Illegal Behavior can never happen during comptime execution.

### Fallback

Any behavior not defined by this specification is considered to be Unchecked Illegal Behavior.  But please remember that this document (and the Zig language itself) is still a work in progress (TODO WIP).  If you find a case that this document does not define, please [open an issue](https://github.com/ziglang/zig-spec/issues) (but please don't do this until "this document" is an actual spec draft).



## What is a Zig compiler?

### Compilation Process

There are several phases involved in compiling Zig.  They do not necessarily happen in order, and may happen in parts interleaved with parts of other phases.  Nonetheless, distinguishing between these phases will be useful later in the document for some reason that I will explain here when I figure out what it is. (TODO: figure out what it is)

#### Parsing

The act of reading in a Zig file and determining its basic structure and set of declarations.  Errors encountered during Parsing are Parse Errors.  A Module is Parsed if any of the following are true: TODO

#### Comptime

Zig allows some types of code to be interpreted at compile time.  Often, the semantics of Zig code are different between comptime and runtime.  Throughought this document, the terms "Interpreted" or "Comptime Executed" will be used to describe code that is run at compile time, and the terms "Executed" or "Runtime Executed" will describe code that runs from the executable produced by the Zig compiler.  These differences will be pointed out throughout this document where they occur.

#### Compilation

Compilation is the process of converting Zig code to a format which can be executed at runtime.  Not all code which is Parsed is necessarily Compiled.  A Declaration is Compiled if it is Exported or if it is referenced by an Expression or Declaration which is Compiled.  An Expression is Compiled if and only if the expression is in an Execution Scope which is Compiled AND the expression is not qualified by a condition which is comptime known to be false AND the expression is not qualified by the comptime modifier, OR the expression is the Root Block of a function declaration which is Compiled.

A function is Compiled if
- The Function is Exported
- An expression which calls the function is Compiled
TODO finish this definition




## What's in a Zig file?

A Zig compiler converts a single Zig file to an executable file, static library, or dynamic library.  This file is referred to throughout this document as the "Root File".  It may include other zig files, which may include other zig files.  Zig files may also include C files, see the [C interoperability addendum](TODO).

### Encoding

TODO: Check the specifics of the unicode issue.  Is this part of the language specification or just the compiler?  I think most language specs leave this up to the implementation, but maybe we should define it?

### Content

A Zig file defines a single struct type.  (Note: this type may contain definitions for other struct types.  How to say this without listing all things which may exist inside a struct?)






### Scopes

A Zig Module consists of a tree of Scopes.  Scopes begin with the token `{` and end with the token `}`.  There are two types of scopes in Zig.

#### Declaration Scopes

All Declaration Scopes may contain any number of the following:

- constant declarations
- global variable declarations
- comptime execution blocks

Some Declaration Scopes may also contain field declarations.  If field declarations are present, they must be contiguous.  In other words, no constant declaration, variable declaration, or comptime block is allowed to exist between two field declarations.  Breaking this rule triggers a Parse Error (TODO: Is this accurate?  Is this how it should be?).

Declaration scopes are unordered.  Expressions in declaration scopes may reference other declarations in the same scope, even if those declarations come after the expression in the text of the file.  Expressions in declaration scopes may even, directly or indirectly, reference themselves, as long as this does not create an illegal dependency loop.

TODO Describe what exactly constitutes an "illegal" dependency loop.  Maybe in another section?

#### Execution Scopes

TODO Describe execution scopes

### Taxonomy of Types

- Integer Types
    - Externable if power of two?
- Floating Point Types
    - Externable
- Bool
    - Externable
- Pointer Types
    - Externable
    - `[*]`
    - `*`
    - `*[N]`
- Enum Types
- Extern struct types
    - Externable
- Packed struct types
    - Externable
- Bare struct types
- Extern union types
    - Externable
- Bare union types
- Tagged union types
- Opaque types
- Function Types
- Frame Types
- AnyFrame
- Optional types
- Slice Types
- Array Types
    - externable if child is externable
	- TODO how does this actually extern?  Like a label?
- Vector types

- ComptimeInt
- ComptimeFloat
- Noreturn
- `@TypeOf(undefined)`
- `@TypeOf(null)`
- EnumLiteral
- StructLiteral?  (would be pretty cool, but it's a slippery slope that ends at CodeLiteral)
- `type`
- Empty Types
    - `void`
- Builtin type aliases
    - usize, isize
    - 

- C Interoperability
    - c_int, c_uint
    - c_long, c_ulong
    - c_longlong, c_ulonglong
    - c_short, c_ushort
    - c_longdouble
    - c_void?  (maybe deprecated, alias for anyopaque(.child)?)
    - `[*c]`


## Execution Model

Zig code can be interpreted at comptime and executed at runtime.  The semantics of many operations are the same in both models.  Any differences between the two models will be called out in the appropriate sections.

### Memory Model

#### Comptime

#### Runtime

### Variables

### Operations

### Panic

## Builtins

## Standard Library

### std.builtin

### std.start


## C Interoperability

### C Types

### Importing C Code

### translate-c


## Build Targets

TODO: How much should this be standardized?


---

Copyright (c) 2020 Zig Software Foundation
