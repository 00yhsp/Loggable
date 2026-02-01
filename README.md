# Loggable

클래스, 구조체, 열거형 및 액터에 `OSLog.Logger` 인스턴스를 편리하게 추가할 수 있는 Swift 매크로입니다.

## 주요 기능

- **자동 Logger 주입**: `OSLog.Logger` 타입의 `logger` 프로퍼티를 자동으로 생성합니다.
- **설정 가능한 카테고리**: 로거에 대한 커스텀 카테고리를 지정할 수 있습니다. 카테고리를 제공하지 않으면 기본적으로 타입 이름이 사용됩니다.
- **Bundle ID 기반 Subsystem**: 로거의 subsystem은 현재 모듈의 번들 식별자(bundle identifier) 또는 프로세스 이름에서 자동으로 파생됩니다.

## 사용법

`@Loggable` 매크로를 사용하려면 클래스, 구조체, 열거형 또는 액터 선언에 매크로를 적용하기만 하면 됩니다.

### 기본 사용법

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

### 커스텀 카테고리 사용

매크로의 인자로 커스텀 카테고리 문자열을 제공할 수 있습니다:

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

## 설치 방법

### Swift Package Manager

`Package.swift` 파일에 `Loggable`을 의존성으로 추가하세요:

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

그 다음, 타겟의 의존성에 `Loggable`을 추가하세요:

```swift
.product(name: "Loggable", package: "Loggable"),
```

## 요구 사양

- Swift 5.9+
- Xcode 15+
- iOS 17.0+ / macOS 14.0+ / tvOS 17.0+ / watchOS 10.0+

## 라이선스

이 프로젝트는 MIT 라이선스에 따라 라이선스가 부여됩니다. 자세한 내용은 [LICENSE](LICENSE) 파일을 참조하세요.

---

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