import Algorithms
import XCTest
@testable import ncaswift

final class ncaswiftTests: XCTestCase {
    func testUniqued() {
        let input = [1, 2, 2, 3, 1]
        XCTAssertEqual(Array(input.uniqued()), [1, 2, 3])
    }
}
