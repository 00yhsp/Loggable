import Foundation
@_exported import OSLog

@attached(member, names: named(logger), named(_LoggableBundleToken))
public macro Loggable() = #externalMacro(module: "LoggableMacros", type: "LoggableMacro")
