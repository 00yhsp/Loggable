import Loggable

@Loggable
final class TestModule {
    func log() { logger.debug("Hello, World!") }
}

TestModule().log()
