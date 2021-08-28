@_exported import XCTest
@_exported @testable import SwepVaporSupport

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
  return [
    testCase(SwepVaporSupportTests.allTests),
  ]
}
#endif