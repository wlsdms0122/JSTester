import XCTest

import JSTesterTests

var tests = [XCTestCaseEntry]()
tests += JSTesterTests.allTests()
XCTMain(tests)
