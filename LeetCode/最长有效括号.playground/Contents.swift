import UIKit

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        let leftBracket = "(", chars: [String] = Array(s).compactMap({ String($0)})
        var stack = [-1], maxLenth = 0
        
        for (index, char) in chars.enumerated() {
            if char == leftBracket {
                stack.append(index)
            }else {
                if stack.count > 1 && chars[stack.last!] == leftBracket {
                    stack.removeLast()
                    maxLenth = max(index - stack.last!, maxLenth)
                } else {
                    stack.append(index)
                }
            }
        }
        
        return maxLenth
    }
}

let solution = Solution()
print("测试Test:\(solution.longestValidParentheses("(()"))")
