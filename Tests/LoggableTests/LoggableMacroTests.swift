import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
@testable import LoggableMacros

final class LoggableMacroTests: XCTestCase {
    let testMacros: [String: Macro.Type] = [
        "Loggable": LoggableMacro.self,
    ]

    // MARK: - Class
    
    func test_ClassWithNoCategory() {
        assertMacroExpansion(
            """
            @Loggable
            class MyClass {
            }
            """,
            expandedSource: """
            class MyClass {

                private final class __macro_local_20_LoggableBundleTokenfMu_ {
                }

                private static func __macro_local_11_makeLoggerfMu_() -> Logger {
                    let bundleID = Bundle(for: __macro_local_20_LoggableBundleTokenfMu_.self).bundleIdentifier
                        ?? ProcessInfo.processInfo.processName
                    let category = String(describing: Self.self)
                    return Logger(subsystem: bundleID, category: category)
                }

                private static let __macro_local_7_loggerfMu_: Logger = __macro_local_11_makeLoggerfMu_()

                var logger: Logger {
                    Self.__macro_local_7_loggerfMu_
                }
            }
            """,
            macros: testMacros
        )
    }

    func test_ClassWithCategory() {
        assertMacroExpansion(
            """
            @Loggable("MyCategory")
            class MyClass {
            }
            """,
            expandedSource: """
            class MyClass {

                private final class __macro_local_20_LoggableBundleTokenfMu_ {
                }

                private static func __macro_local_11_makeLoggerfMu_() -> Logger {
                    let bundleID = Bundle(for: __macro_local_20_LoggableBundleTokenfMu_.self).bundleIdentifier
                        ?? ProcessInfo.processInfo.processName
                    let category = "MyCategory"
                    return Logger(subsystem: bundleID, category: category)
                }

                private static let __macro_local_7_loggerfMu_: Logger = __macro_local_11_makeLoggerfMu_()

                var logger: Logger {
                    Self.__macro_local_7_loggerfMu_
                }
            }
            """,
            macros: testMacros
        )
    }

    // MARK: - Struct

    func test_StructWithNoCategory() {
        assertMacroExpansion(
            """
            @Loggable
            struct MyStruct {
            }
            """,
            expandedSource: """
            struct MyStruct {

                private final class __macro_local_20_LoggableBundleTokenfMu_ {
                }

                private static func __macro_local_11_makeLoggerfMu_() -> Logger {
                    let bundleID = Bundle(for: __macro_local_20_LoggableBundleTokenfMu_.self).bundleIdentifier
                        ?? ProcessInfo.processInfo.processName
                    let category = String(describing: Self.self)
                    return Logger(subsystem: bundleID, category: category)
                }

                private static let __macro_local_7_loggerfMu_: Logger = __macro_local_11_makeLoggerfMu_()

                var logger: Logger {
                    Self.__macro_local_7_loggerfMu_
                }
            }
            """,
            macros: testMacros
        )
    }

    func test_StructWithCategory() {
        assertMacroExpansion(
            """
            @Loggable("MyCategory")
            struct MyStruct {
            }
            """,
            expandedSource: """
            struct MyStruct {

                private final class __macro_local_20_LoggableBundleTokenfMu_ {
                }

                private static func __macro_local_11_makeLoggerfMu_() -> Logger {
                    let bundleID = Bundle(for: __macro_local_20_LoggableBundleTokenfMu_.self).bundleIdentifier
                        ?? ProcessInfo.processInfo.processName
                    let category = "MyCategory"
                    return Logger(subsystem: bundleID, category: category)
                }

                private static let __macro_local_7_loggerfMu_: Logger = __macro_local_11_makeLoggerfMu_()

                var logger: Logger {
                    Self.__macro_local_7_loggerfMu_
                }
            }
            """,
            macros: testMacros
        )
    }

    // MARK: - Actor

    func test_ActorWithNoCategory() {
        assertMacroExpansion(
            """
            @Loggable
            actor MyActor {
            }
            """,
            expandedSource: """
            actor MyActor {

                private final class __macro_local_20_LoggableBundleTokenfMu_ {
                }

                private static func __macro_local_11_makeLoggerfMu_() -> Logger {
                    let bundleID = Bundle(for: __macro_local_20_LoggableBundleTokenfMu_.self).bundleIdentifier
                        ?? ProcessInfo.processInfo.processName
                    let category = String(describing: Self.self)
                    return Logger(subsystem: bundleID, category: category)
                }

                private static let __macro_local_7_loggerfMu_: Logger = __macro_local_11_makeLoggerfMu_()

                var logger: Logger {
                    Self.__macro_local_7_loggerfMu_
                }
            }
            """,
            macros: testMacros
        )
    }

    func test_ActorWithCategory() {
        assertMacroExpansion(
            """
            @Loggable("MyCategory")
            actor MyActor {
            }
            """,
            expandedSource: """
            actor MyActor {

                private final class __macro_local_20_LoggableBundleTokenfMu_ {
                }

                private static func __macro_local_11_makeLoggerfMu_() -> Logger {
                    let bundleID = Bundle(for: __macro_local_20_LoggableBundleTokenfMu_.self).bundleIdentifier
                        ?? ProcessInfo.processInfo.processName
                    let category = "MyCategory"
                    return Logger(subsystem: bundleID, category: category)
                }

                private static let __macro_local_7_loggerfMu_: Logger = __macro_local_11_makeLoggerfMu_()

                var logger: Logger {
                    Self.__macro_local_7_loggerfMu_
                }
            }
            """,
            macros: testMacros
        )
    }

    // MARK: - Enum

    func test_EnumWithNoCategory() {
        assertMacroExpansion(
            """
            @Loggable
            enum MyEnum {
            }
            """,
            expandedSource: """
            enum MyEnum {

                private final class __macro_local_20_LoggableBundleTokenfMu_ {
                }

                private static func __macro_local_11_makeLoggerfMu_() -> Logger {
                    let bundleID = Bundle(for: __macro_local_20_LoggableBundleTokenfMu_.self).bundleIdentifier
                        ?? ProcessInfo.processInfo.processName
                    let category = String(describing: Self.self)
                    return Logger(subsystem: bundleID, category: category)
                }

                private static let __macro_local_7_loggerfMu_: Logger = __macro_local_11_makeLoggerfMu_()

                var logger: Logger {
                    Self.__macro_local_7_loggerfMu_
                }
            }
            """,
            macros: testMacros
        )
    }

    func test_EnumWithCategory() {
        assertMacroExpansion(
            """
            @Loggable("MyCategory")
            enum MyEnum {
            }
            """,
            expandedSource: """
            enum MyEnum {

                private final class __macro_local_20_LoggableBundleTokenfMu_ {
                }

                private static func __macro_local_11_makeLoggerfMu_() -> Logger {
                    let bundleID = Bundle(for: __macro_local_20_LoggableBundleTokenfMu_.self).bundleIdentifier
                        ?? ProcessInfo.processInfo.processName
                    let category = "MyCategory"
                    return Logger(subsystem: bundleID, category: category)
                }

                private static let __macro_local_7_loggerfMu_: Logger = __macro_local_11_makeLoggerfMu_()

                var logger: Logger {
                    Self.__macro_local_7_loggerfMu_
                }
            }
            """,
            macros: testMacros
        )
    }

    // MARK: - Error

    func test_ErrorOnProtocol() {
        assertMacroExpansion(
            """
            @Loggable
            protocol MyProtocol {
            }
            """,
            expandedSource: """
            protocol MyProtocol {
            }
            """,
            diagnostics: [
                DiagnosticSpec(message: "@Loggable can only be applied to classes, structs, and actors", line: 1, column: 1)
            ],
            macros: testMacros
        )
    }
}
