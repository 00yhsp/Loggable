# Getting Started with Loggable

Learn how to quickly add logging capabilities to your Swift types.

## Overview

The `@Loggable` macro is designed to eliminate the boilerplate code typically required when setting up `OSLog`. By simply annotating your type, the macro automatically synthesizes a configured `logger` property.

## Basic Usage

To get started, import the `Loggable` module and apply the `@Loggable` attribute to any supported type (Class, Struct, Enum, or Actor).

```swift
import Loggable

@Loggable
class AuthenticationService {
    func login(username: String) {
        logger.info("Attempting to log in user: \(username)")
        
        // ... login logic ...
        
        logger.debug("Login successful.")
    }
}
```

### What happens under the hood?

When you apply `@Loggable`, the macro generates the following:
1.  A static logger instance to ensure it's only created once per type.
2.  An instance property named `logger` that accesses the static instance.
3.  Automatic configuration of the logger's `subsystem` (using your app's Bundle Identifier) and `category` (using the type's name, e.g., "AuthenticationService").

This allows you to immediately start calling `logger.info()`, `logger.debug()`, `logger.error()`, etc., without any manual setup.