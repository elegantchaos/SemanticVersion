import XCTest
@testable import SemanticVersion

final class SemanticVersionTests: XCTestCase {
    func testExample() {
        let version = SemanticVersion(1, 0, 0)
        XCTAssertEqual(version.major, 1)
        XCTAssertEqual(version.minor, 0)
        XCTAssertEqual(version.patch, 0)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
