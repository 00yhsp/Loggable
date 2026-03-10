# Supported Types

Understand where you can apply the `@Loggable` macro.

## Overview

The `@Loggable` macro is a member macro, meaning it adds new members (properties and methods) to the type it is attached to. Due to Swift's syntax and type system, it can only be applied to specific kinds of declarations.

## Allowed Declarations (Concrete Types)

You can safely apply `@Loggable` to the following concrete types:

- **Classes** (`class`)
- **Structures** (`struct`)
- **Actors** (`actor`)
- **Enumerations** (`enum`)

```swift
@Loggable class MyClass {}
@Loggable struct MyStruct {}
@Loggable actor MyActor {}
@Loggable enum MyEnum {}
```

## Unsupported Declarations

The macro cannot be applied to protocols or extensions. If you attempt to do so, the compiler will emit a diagnostic error to guide you:

### Protocols
`@Loggable` can only be applied to concrete types, not protocols, because protocols cannot contain the required private/static members.

```swift
// ❌ Error: @Loggable can only be applied to concrete types (classes, structs, enums, and actors), not protocols.
@Loggable 
protocol MyProtocol {
    func doSomething()
}
```

### Extensions
To avoid **Redeclaration** issues, `@Loggable` must be applied to the main type declaration rather than an extension.

```swift
// ❌ Error: @Loggable cannot be applied to extensions. Please apply it to the main type declaration to avoid redeclaration issues.
@Loggable 
extension MyClass {
    func doSomethingExtra() {
        logger.info("Doing extra work")
    }
}
```

If you need logging within a protocol extension, you must define the logger manually or ensure that conforming types apply the `@Loggable` macro themselves.
