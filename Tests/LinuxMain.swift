import XCTest

import SemanticVersionTests

var tests = [XCTestCaseEntry]()
tests += SemanticVersionTests.allTests()
XCTMain(tests)
