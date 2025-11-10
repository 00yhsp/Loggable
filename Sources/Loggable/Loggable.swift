import Foundation
@_exported import OSLog

/// A member macro that adds a `Logger` instance to a class, struct, or actor.
///
/// This macro synthesizes a `logger` property that provides a `Logger` instance
/// from the `OSLog` framework. The logger is automatically configured with the
/// bundle identifier as the subsystem and the type name as the category.
///
/// ## Usage
///
/// ```swift
/// @Loggable
/// class MyService {
///     func doSomething() {
///         logger.info("Doing something important.")
///     }
/// }
/// ```
///
/// You can also provide a custom category for the logger:
///
/// ```swift
/// @Loggable("Networking")
/// class NetworkManager {
///     func fetchData() {
///         logger.debug("Fetching data from server.")
///     }
/// }
/// ```
@attached(member, names: named(logger), named(_LoggableBundleToken), named(_logger), named(_makeLogger))
public macro Loggable(_ category: String? = nil) = #externalMacro(module: "LoggableMacros", type: "LoggableMacro")
