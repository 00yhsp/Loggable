# Supported Types

Understand where you can apply the `@Loggable` macro.

## Overview

The `@Loggable` macro is a member macro, meaning it adds new members (properties and methods) to the type it is attached to. Due to Swift's syntax and type system, it can only be applied to specific kinds of declarations.

## Allowed Declarations

You can safely apply `@Loggable` to the following types:

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

The macro cannot be applied to protocols or extensions. If you attempt to do so, the compiler will emit a diagnostic error:

```swift
// ❌ Error: @Loggable can only be applied to classes, structs, and actors
@Loggable 
protocol MyProtocol {
    func doSomething()
}
```

If you need logging within a protocol extension, you must define the logger manually or ensure that conforming types apply the `@Loggable` macro themselves.