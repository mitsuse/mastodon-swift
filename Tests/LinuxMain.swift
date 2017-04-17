import XCTest

@testable import MastodonTests

XCTMain([
    testCase(MastodonTests.allTests),
    testCase(MammutTests.allTests),
])
