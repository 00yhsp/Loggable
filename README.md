# Loggable

A Swift macro that provides a convenient way to add an `OSLog.Logger` instance to your classes, structs, enums, and actors.

## Features

- **Automatic Logger Injection**: Automatically synthesizes a `logger` property of type `OSLog.Logger`.
- **Configurable Category**: Allows specifying a custom category for the logger. If no category is provided, it defaults to the type's name.
- **Subsystem based on Bundle ID**: The logger's subsystem is automatically derived from the bundle identifier of the current module or the process name.

## Usage

To use the `@Loggable` macro, simply apply it to your class, struct, enum, or actor declaration.

### Basic Usage

```swift
import Loggable

@Loggable
class MyService {
    func doSomething() {
        logger.info("Doing something important.")
    }
}

@Loggable
struct MyViewModel {
    func loadData() {
        logger.debug("Loading data for view model.")
    }
}
```

### With Custom Category

You can provide a custom category string as an argument to the macro:

```swift
import Loggable

@Loggable("Networking")
class NetworkManager {
    func fetchData() {
        logger.debug("Fetching data from server.")
    }
}

@Loggable("Database")
enum DatabaseError: Error {
    case connectionFailed
    case queryFailed

    func logError() {
        logger.error("Database error occurred: \(self.localizedDescription)")
    }
}
```

## Installation

### Swift Package Manager

Add `Loggable` as a dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/your-username/Loggable.git", from: "1.0.0"),
],
targets: [
    .target(
        name: "YourTarget",
        dependencies: ["Loggable"]
    ),
    .macro(
        name: "LoggableMacros",
        dependencies: [
            .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
            .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
        ]
    ),
]
```

Then, add `Loggable` to your target's dependencies:

```swift
.product(name: "Loggable", package: "Loggable"),
```

## Requirements

- Swift 5.9+
- Xcode 15+
- iOS 17.0+ / macOS 14.0+ / tvOS 17.0+ / watchOS 10.0+

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
