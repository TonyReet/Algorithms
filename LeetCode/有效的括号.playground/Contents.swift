import UIKit

class Solution {
    func isValid(_ s: String) -> Bool {
        let chars: [String] = Array(s).compactMap({String($0)})
        if chars.count%2 == 1 || s.isEmpty == true {return false}
    
        let validMap = ["(":")", "[": "]", "{": "}"]
        var stack = [String]()
        let vaildKeys = validMap.keys
        for char in chars {
            if vaildKeys.contains(char) {
                stack.append(validMap[char]!)
            } else {
                if stack.last == char {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}

let solution = Solution()
//print("测试Test:\(solution.isValid("()[]{}"))")
print("测试Test:\(solution.isValid("(){}}{"))")
print("测试Test:\(solution.isValid("{[]}"))")
print("测试Test:\(solution.isValid("(){[]}"))")
print("测试Test:\(solution.isValid("(("))")
