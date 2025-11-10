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
        try validate(declaration: declaration)

        let categoryExpr = categoryExpression(from: node)

        let bundleTokenName = context.makeUniqueName("_LoggableBundleToken")
        let loggerVariableName = context.makeUniqueName("_logger")
        let makeLoggerFunctionName = context.makeUniqueName("_makeLogger")

        let tokenDecl: DeclSyntax =
        """
        private final class \(bundleTokenName) { }
        """

        let _loggerDecl: DeclSyntax =
        """
        private static let \(loggerVariableName): Logger = \(makeLoggerFunctionName)()
        """

        let _makeLoggerDecl: DeclSyntax =
        """
        private static func \(makeLoggerFunctionName)() -> Logger {
            let bundleID = Bundle(for: \(bundleTokenName).self).bundleIdentifier
                ?? ProcessInfo.processInfo.processName
            let category = \(categoryExpr)
            return Logger(subsystem: bundleID, category: category)
        }
        """

        let loggerDecl: DeclSyntax =
        """
        var logger: Logger { Self.\(loggerVariableName) }
        """

        return [tokenDecl, _makeLoggerDecl, _loggerDecl, loggerDecl]
    }

    private static func validate(declaration: some DeclGroupSyntax) throws {
        guard allowTypes.contains(declaration.kind) else {
            throw MacroExpansionErrorMessage("@Loggable can only be applied to classes, structs, and actors")
        }
    }

    private static func categoryExpression(from node: AttributeSyntax) -> ExprSyntax {
        if let args = node.arguments?.as(LabeledExprListSyntax.self),
           let first = args.first?.expression,
           first.is(StringLiteralExprSyntax.self) {
            return first
        } else {
            return ExprSyntax("String(describing: Self.self)")
        }
    }
}

@main
struct LoggablePlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        LoggableMacro.self,
    ]
}
