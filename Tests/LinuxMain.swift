import XCTest

import perf_testsTests

var tests = [XCTestCaseEntry]()
tests += perf_testsTests.allTests()
XCTMain(tests)