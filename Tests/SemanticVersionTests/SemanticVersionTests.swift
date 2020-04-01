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

    func testInitialisationFromArrayLiteral() {
        let version: SemanticVersion = [1]
        XCTAssertEqual(version.major, 1)
        XCTAssertEqual(version.minor, 0)
        XCTAssertEqual(version.patch, 0)

        let version2: SemanticVersion = [1, 2]
        XCTAssertEqual(version2.major, 1)
        XCTAssertEqual(version2.minor, 2)
        XCTAssertEqual(version2.patch, 0)

        let version3: SemanticVersion = [1,2,3]
        XCTAssertEqual(version3.major, 1)
        XCTAssertEqual(version3.minor, 2)
        XCTAssertEqual(version3.patch, 3)
    }

    func testInitialisationFromStrings() {
        let version = SemanticVersion(major: "1", minor: "0", patch: "0")
        XCTAssertEqual(version.major, 1)
        XCTAssertEqual(version.minor, 0)
        XCTAssertEqual(version.patch, 0)

        let version2 = SemanticVersion(major: "1", minor: "0")
        XCTAssertEqual(version2.major, 1)
        XCTAssertEqual(version2.minor, 0)
        XCTAssertEqual(version2.patch, 0)

        let version3 = SemanticVersion(1)
        XCTAssertEqual(version3.major, 1)
        XCTAssertEqual(version3.minor, 0)
        XCTAssertEqual(version3.patch, 0)
    }
    
    func testInitialisationFromString() {
        let version = SemanticVersion("1.2.3")
        XCTAssertEqual(version.major, 1)
        XCTAssertEqual(version.minor, 2)
        XCTAssertEqual(version.patch, 3)

        let version2 = SemanticVersion("1.2")
        XCTAssertEqual(version2.major, 1)
        XCTAssertEqual(version2.minor, 2)
        XCTAssertEqual(version2.patch, 0)

        let version3 = SemanticVersion("1")
        XCTAssertEqual(version3.major, 1)
        XCTAssertEqual(version3.minor, 0)
        XCTAssertEqual(version3.patch, 0)
    }

    func testInitialisationFromStringLiteral() {
        let version: SemanticVersion = "1.2.3"
        XCTAssertEqual(version.major, 1)
        XCTAssertEqual(version.minor, 2)
        XCTAssertEqual(version.patch, 3)

        let version2: SemanticVersion = "1.2"
        XCTAssertEqual(version2.major, 1)
        XCTAssertEqual(version2.minor, 2)
        XCTAssertEqual(version2.patch, 0)

        let version3: SemanticVersion = "1"
        XCTAssertEqual(version3.major, 1)
        XCTAssertEqual(version3.minor, 0)
        XCTAssertEqual(version3.patch, 0)
    }

    func testWithV() {
        let version = SemanticVersion("v1.2.3")
        XCTAssertEqual(version.major, 1)
        XCTAssertEqual(version.minor, 2)
        XCTAssertEqual(version.patch, 3)
    }
    
    func testAsString() {
        XCTAssertEqual(SemanticVersion().asString, "<unknown>")
        XCTAssertEqual(SemanticVersion(1,2,0).asString, "1.2")
        XCTAssertEqual(SemanticVersion(1,2,3).asString, "1.2.3")
    }
    
    func testBadlyFormed() {
        XCTAssertTrue(SemanticVersion("").isInvalid)
        XCTAssertTrue(SemanticVersion("x").isInvalid)
        XCTAssertTrue(SemanticVersion(major: "1", minor: "2", patch: "x").isInvalid)
        XCTAssertTrue(SemanticVersion(major: "1", minor: "x", patch: "3").isInvalid)
        XCTAssertTrue(SemanticVersion(major: "x", minor: "2", patch: "3").isInvalid)
    }
    
    func testComparison() {
        XCTAssertTrue(SemanticVersion(1, 0) < SemanticVersion(2, 0))
        XCTAssertFalse(SemanticVersion(2, 0) < SemanticVersion(1, 0))

        XCTAssertTrue(SemanticVersion(1, 0) < SemanticVersion(1, 1))
        XCTAssertFalse(SemanticVersion(1, 1) < SemanticVersion(1, 0))

        XCTAssertTrue(SemanticVersion(1, 0, 0) < SemanticVersion(1, 0, 1))
        XCTAssertFalse(SemanticVersion(1, 0, 1) < SemanticVersion(1, 0, 0))

        XCTAssertTrue(SemanticVersion(1, 0) == SemanticVersion(1, 0))
        XCTAssertTrue(SemanticVersion(2, 0) > SemanticVersion(1, 0))
    }
    
    func testDisplayString() {
        XCTAssertEqual(SemanticVersion(1,2,3).display(), "1.2.3")
        XCTAssertEqual(SemanticVersion(1,2,3).display(as: "Test"), "Test 1.2.3")
        XCTAssertEqual(SemanticVersion(1,2,3).display(build: 456), "1.2.3 (456)")
        XCTAssertEqual(SemanticVersion(1,2,3).display(as: "Test", build: 456), "Test 1.2.3 (456)")
    }
}
