import XCTest
@testable import SemanticVersion

final class SemanticVersionTests: XCTestCase {
    func testInitialisation() {
        let version = SemanticVersion(1, 0, 0)
        XCTAssertEqual(version.major, 1)
        XCTAssertEqual(version.minor, 0)
        XCTAssertEqual(version.patch, 0)

        let version2 = SemanticVersion(1, 0)
        XCTAssertEqual(version2.major, 1)
        XCTAssertEqual(version2.minor, 0)
        XCTAssertEqual(version2.patch, 0)

        let version3 = SemanticVersion(1)
        XCTAssertEqual(version3.major, 1)
        XCTAssertEqual(version3.minor, 0)
        XCTAssertEqual(version3.patch, 0)
    }

    func testInitialisationFromString() {
        let version = SemanticVersion(major: "1", minor: "0", patch: "0")!
        XCTAssertEqual(version.major, 1)
        XCTAssertEqual(version.minor, 0)
        XCTAssertEqual(version.patch, 0)

        let version2 = SemanticVersion(major: "1", minor: "0")!
        XCTAssertEqual(version2.major, 1)
        XCTAssertEqual(version2.minor, 0)
        XCTAssertEqual(version2.patch, 0)

        let version3 = SemanticVersion(1)
        XCTAssertEqual(version3.major, 1)
        XCTAssertEqual(version3.minor, 0)
        XCTAssertEqual(version3.patch, 0)
    }
}
