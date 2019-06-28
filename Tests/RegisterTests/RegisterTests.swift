import XCTest
@testable import Register

final class RegisterTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Register().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
