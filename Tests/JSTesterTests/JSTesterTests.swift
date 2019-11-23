import XCTest
@testable import JSTester

final class JSTesterTests: XCTestCase {
    class SumTwoNumber: Tester<(Int, Int), Int> {
        override func solve(_ input: (Int, Int)) -> Int {
            return input.0 + input.1
        }
    }
    
    // MARK: - properties
    var problem: SumTwoNumber!
    
    // MARK: - test setting
    static var allTests = [
        ("testExecute", testExecute),
        ("testNotMatchInputOutput", testNotMatchInputOutput)
    ]
    
    override func setUp() {
        problem = SumTwoNumber()
    }
    
    // MARK: - test case
    func testExecute() {
        // Given
        problem.inputs = [
            (1, 3),
            (5, 10),
            (-3, 2)
        ]
        
        problem.outputs = [
            4,
            10,
            -1
        ]
        
        // When
        let results = problem.execute()
        
        // Then
        XCTAssertEqual(results, [true, false, true])
    }
    
    func testNotMatchInputOutput() {
        // Given
        problem.inputs = [
            (5, 1)
        ]
        
        problem.outputs = [
            4,
            9
        ]
        
        // When
        let results = problem.execute()
        
        // Then
        XCTAssertEqual(results.isEmpty, true)
    }
}
