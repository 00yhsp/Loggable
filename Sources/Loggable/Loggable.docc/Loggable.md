# ``Loggable``

A Swift Macro that automatically adds a `Logger` instance to any class, enum, struct, or actor.

## Overview

`Loggable` simplifies the boilerplate required to set up `os.Logger` for your Swift types.
By using the `@Loggable` macro, you get a `logger` property that is automatically configured
with your bundle identifier and the type's name as the category.

### Features
- 🚀 **Zero Boilerplate**: Eliminates repetitive logger instantiation.
- 🛠️ **Declarative Configuration**: Automatically manages subsystems and categories, freeing you from manual ID management.
- 🎯 **Compile-Time Safety**: Eliminates the risk of mistyped strings that aren't caught at compile time.

## Topics

### Articles

- <doc:GettingStarted>
- <doc:CustomCategories>
- <doc:SupportedTypes>

### Macros

- ``Loggable(_:)``

## Usage

Check out the following example to see how easy it is to add logging to your classes.

```swift
import Loggable

@Loggable
class MyService {
    func doSomething() {
        logger.info("Doing something important.")
    }
}
```

Or with a custom category:

```swift
@Loggable("Networking")
class NetworkManager {
    func fetchData() {
        logger.debug("Fetching data from server.")
    }
}
```
