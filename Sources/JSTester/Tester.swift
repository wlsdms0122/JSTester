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
    
    public init() {
        
    }
    
    // MARK: - private method
    private func success(case: Int) {
        print(" 💚 Teatcase #\(`case`) was succeed.")
    }
    
    private func fail(case: Int, executed: Output, expected: Output) {
        print(" ❤️ Teatcase #\(`case`) was failed.")
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
    public func execute() {
        guard inputs.count == outputs.count else {
            print("Can't execute test cases. Because injected inputs & outputs aren't matched.")
            return
        }
        
        let count = inputs.map { solve($0) }
            .enumerated()
            .reduce(0) {
                // Get answer
                let answer = outputs[$1.offset]
                // Print resut log
                if $1.element == answer {
                    success(case: $1.offset + 1)
                    return $0 + 1
                } else {
                    fail(case: $1.offset + 1, executed: $1.element, expected: answer)
                    return $0
                }
            }
        
        result(success: count, total: inputs.count)
    }
    
    open func solve(_ input: Input) -> Output {
        fatalError("Can't solve problem by default. Inheritance required.")
    }
}
