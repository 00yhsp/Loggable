import Foundation
@_exported import OSLog

@attached(member, names: named(logger), named(_LoggableBundleToken), named(_logger), named(_makeLogger))
public macro Loggable(_ category: String? = nil) = #externalMacro(module: "LoggableMacros", type: "LoggableMacro")
