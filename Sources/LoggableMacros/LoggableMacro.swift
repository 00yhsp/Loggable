import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct LoggableMacro: MemberMacro {
    private static let allowTypes: [SyntaxKind] = [.classDecl, .structDecl, .actorDecl]

    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard allowTypes.contains(declaration.kind) else {
            throw MacroExpansionErrorMessage("@Loggable can only be applied to classes, structs, and actors")
        }

        return [
            DeclSyntax(
                #"""
                private final class _LoggableBundleToken { }
                """#
            ),
            DeclSyntax(
                #"""
                private static let logger: Logger = {
                    let bundleID = Bundle(for: _LoggableBundleToken.self).bundleIdentifier ?? ProcessInfo.processInfo.processName
                    return Logger(subsystem: bundleID, category: String(describing: Self.self))
                }()
                """#
            )
        ]
    }
}

@main
struct LoggablePlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        LoggableMacro.self,
    ]
}
