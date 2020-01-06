# JSTester
![SPM](https://img.shields.io/badge/SPM-supported-red)
![platform](https://img.shields.io/badge/platform-mac%2010.15-green)

A algorithm problem test helper.


# Getting Started
This package has only 1 class named `Tester` right this.

```swift
class Tester<Input, Output: Equatable> {
    // It is property you must inject information to test.
    var inputs: [Input] = []
    var outputs: [Output] = []
    
    // Use this property for debug of specific testcase. Set breakpoint or any condition. 
    var testcase: Int = 0
    
    // It is simple functions about solve the problem.
    func execute()
    func solve(_ input: Input) -> Output
}
```

Let's solve the problem! 🤪

1. Create problem class inherited `Tester`.
2. Override `func solve(_ input: Input) -> Output`.

```swift
class LeetCode_136_Single_Number: Tester<[Int], Int> {

    override func solve(_ input: [Int]) -> Int {
        nums.reduce(0, ^)
    }
}
```

3. Instantiate `LeetCode_1_Two_Sum` and inject input & output information.

```swift
// Create problem object
let problem = LeetCode_1_Two_Sum()

// Inject input & output information
problem.inputs = [
    [2, 2, 1],
    [4, 1, 2, 1, 2]
]

problem.outputs = [
    1,
    4
]
```

4. Call `func execute()` for testing
5. See console log...

# License
JSTester is available under the MIT license.
