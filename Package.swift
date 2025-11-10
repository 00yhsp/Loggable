// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "Loggable",
    platforms: [.macOS(.v11), .iOS(.v14), .tvOS(.v14), .watchOS(.v7)],
    products: [
        .library(
            name: "Loggable",
            targets: ["Loggable"]
        ),
        .executable(
            name: "LoggableClient",
            targets: ["LoggableClient"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "600.0.0-latest"),
    ],
    targets: [
        .macro(
            name: "LoggableMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .target(name: "Loggable", dependencies: ["LoggableMacros"]),
        .executableTarget(name: "LoggableClient", dependencies: ["Loggable"]),
        .testTarget(
            name: "LoggableTests",
            dependencies: [
                "Loggable",
                "LoggableMacros",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
    ]
)
