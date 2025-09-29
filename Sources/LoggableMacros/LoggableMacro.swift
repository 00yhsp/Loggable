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

        let categoryExpr: ExprSyntax = {
            if let args = node.arguments?.as(LabeledExprListSyntax.self),
               let first = args.first?.expression,
               first.is(StringLiteralExprSyntax.self) {
                return first
            } else {
                return ExprSyntax(stringLiteral: "String(describing: Self.self)")
            }
        }()

        let tokenDecl: DeclSyntax =
        """
        private final class _LoggableBundleToken { }
        """

        let _loggerDecl: DeclSyntax =
        """
        private static let _logger: Logger = _makeLogger()
        """

        let _makeLoggerDecl: DeclSyntax =
        """
        private static func _makeLogger() -> Logger {
            let bundleID = Bundle(for: _LoggableBundleToken.self).bundleIdentifier
                ?? ProcessInfo.processInfo.processName
            let category = \(categoryExpr)
            return Logger(subsystem: bundleID, category: category)
        }
        """

        let loggerDecl: DeclSyntax =
        """
        var logger: Logger { Self._logger }
        """

        return [tokenDecl, _makeLoggerDecl, _loggerDecl, loggerDecl]
    }
}

@main
struct LoggablePlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        LoggableMacro.self,
    ]
}
