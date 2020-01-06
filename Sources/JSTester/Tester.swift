//
//  Tester.swift
//  Tester
//
//  Created by JSilver on 2019/11/23.
//  Copyright © 2019 JSilver. All rights reserved.
//

open class Tester<Input, Output: Equatable> {
    // MARK: - properties
    public var inputs: [Input] = []
    public var outputs: [Output] = []
    
    private(set) var testcase: Int = 0
    
    public init() {
        
    }
    
    // MARK: - private method
    private func success(case: Int) {
        print(" 💚 Testcase #\(`case`) was succeed.")
    }
    
    private func fail(case: Int, executed: Output, expected: Output) {
        print(" ❤️ Testcase #\(`case`) was failed.")
        print("    Your execution is \(executed), but we expected \(expected)")
    }
    
    private func result(success: Int, total: Int) {
        let ratio = success * 100 / total
        
        let mark: String
        if ratio == 100 {
            mark = "😎"
        } else if ratio >= 80 {
            mark = "🤓"
        } else if ratio >= 60 {
            mark = "🧐"
        } else if ratio >= 40 {
            mark = "🤨"
        } else if ratio >= 20 {
            mark = "😓"
        } else {
            mark = "😰"
        }
        
        print("\n \(mark) Test completed. result: \(success)/\(total).")
    }
    
    // MARK: - public method
    @discardableResult
    public func execute() -> [Bool] {
        guard inputs.count == outputs.count else {
            print("Can't execute test cases. Because injected inputs & outputs aren't matched.")
            return []
        }
        
        var results: [Bool] = []
        let count = inputs.enumerated()
            .map { input -> (testcase: Int, output: Output) in
                testcase = input.offset
                return (input.offset, solve(input.element))
            }
            .reduce(0) {
                // Get answer
                let answer = outputs[$1.testcase]
                // Compare result
                let result = $1.output == answer
                results.append(result)
                
                // Print result log
                if result {
                    success(case: $1.testcase + 1)
                    return $0 + 1
                } else {
                    fail(case: $1.testcase + 1, executed: $1.output, expected: answer)
                    return $0
                }
            }
        
        result(success: count, total: inputs.count)
        return results
    }
    
    open func solve(_ input: Input) -> Output {
        fatalError("Can't solve problem by default. Inheritance required.")
    }
}
