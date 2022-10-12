import UIKit

class Solution {
//    // 暴力求解
//    func longestPalindrome(_ s: String) -> String {
//        if s.count < 2 {
//            return s
//        }
//
//        var maxLength = 1
//        let chars = Array(s)
//        var maxSubString: String = String(chars.first!)
//        let charsCount = chars.count
//
//        for outIndex in 0..<charsCount - 1 {
//            for inIndex in Int(outIndex+1)..<charsCount {
//                let subString = chars[outIndex...inIndex]
//                if isPalindrome(Array(subString)) && subString.count > maxLength{
//                    maxLength = subString.count
//                    maxSubString = String(subString)
//                }
//            }
//        }
//
//        return maxSubString
//    }
//
//    private func isPalindrome(_ chars: [Character]) -> Bool {
//        var left = 0
//        var right = chars.count - 1
//
//        while left < right {
//            if chars[left] != chars[right] {
//                return false
//            }
//
//            left += 1
//            right -= 1
//        }
//
//        return true
//    }

//    // 中心扩散
//    func longestPalindrome(_ s: String) -> String {
//        if s.count < 2 {
//            return s
//        }
//        let chars = Array(s)
//
//        var start = 0
//        var end = 0
//        var maxLength = 1
//        for index in 0..<chars.count {
//            let oddLen = expandCenter(array: chars, left: index, right: index)
//            let evenLen = expandCenter(array: chars, left: index, right: index + 1)
//            let maxLen = max(oddLen, evenLen)
//
//            if maxLen > maxLength {
//                start = index - (maxLen - 1)/2
//                end = index + maxLen/2
//                maxLength = maxLen
//            }
//        }
//
//        return String(chars[start...end])
//    }
//
//    func expandCenter(array: [Character], left: Int, right: Int) -> Int {
//        if array.count < 2 || (left == 0 && right == 0){
//            return 1
//        }
//
//        var left = left
//        var right = right
//        while left >= 0 && right < array.count && array[left] == array[right]{
//            left -= 1
//            right += 1
//        }
//        return right - left - 1
//    }

    // 动态规划
    func longestPalindrome(_ s: String) -> String {
        if s.count < 2 {
            return s
        }
        
        let len = s.count
        var maxLen = 1
        var begin = 0
        let chars = Array(s)
        
        var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: len), count: len)
        for index in 0..<len {
            dp[index][index] = true
        }
        
        for rightIndex in 1..<len {
            for leftIndex in 0..<rightIndex {
                if chars[leftIndex] != chars[rightIndex] {
                    dp[leftIndex][rightIndex] = false
                } else {
                    /*
                    推到过程
                    奇数：left + 1 < right - 1 => right - left < 2
                    偶数：left + 1 == right - 1 => right - left = 2
                    总结：right - left <= 2 即 right - left < 3
                     */
                    if rightIndex - leftIndex < 3 {
                        dp[leftIndex][rightIndex] = true
                    } else {
                        dp[leftIndex][rightIndex] = dp[leftIndex + 1][rightIndex - 1]
                    }
                }
                
                let tmpLen = rightIndex - leftIndex + 1
                if dp[leftIndex][rightIndex] && (tmpLen > maxLen) {
                    maxLen = tmpLen
                    begin = leftIndex
                }
            }
        }
        
        return String(chars[begin...(begin + maxLen - 1)])
    }
}
let solution = Solution()

//print("测试Test1:\(solution.longestPalindrome("babad"))")
//print("测试Test2:\(solution.longestPalindrome("cbbd"))")
//print("测试Test3:\(solution.longestPalindrome("cc"))")
//print("测试Test4:\(solution.longestPalindrome("s"))")
//print("测试Test5:\(solution.longestPalindrome("ac"))")
//print("测试Test5:\(solution.longestPalindrome("ccc"))")
print("测试Test5:\(solution.longestPalindrome("aaaaa"))")
//print("测试Test6:\(solution.longestPalindrome("klvxwqyzugrdoaccdafdfrvxiowkcuedfhoixzipxrkzbvpusslsgfjocvidnpsnkqdfnnzzawzsslwnvvjyoignsfbxkgrokzyusxikxumrxlzzrnbtrixxfioormoyyejashrowjqqzifacecvoruwkuessttlexvdptuvodoavsjaepvrfvbdhumtuvxufzzyowiswokioyjtzzmevttheeyjqcldllxvjraeyflthntsmipaoyjixygbtbvbnnrmlwwkeikhnnmlfspjgmcxwbjyhomfjdcnogqjviggklplpznfwjydkxzjkoskvqvnxfzdrsmooyciwulvtlmvnjbbmffureoilszlonibbcwfsjzguxqrjwypwrskhrttvnqoqisdfuifqnabzbvyzgbxfvmcomneykfmycevnrcsyqclamfxskmsxreptpxqxqidvjbuduktnwwoztvkuebfdigmjqfuolqzvjincchlmbrxpqgguwuyhrdtwqkdlqidlxzqktgzktihvlwsbysjeykiwokyqaskjjngovbagspyspeghutyoeahhgynzsyaszlirmlekpboywqdliumihwnsnwjc"))")
//
