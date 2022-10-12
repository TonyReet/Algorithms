import UIKit

class Solution {
    // 滑动窗口
    func lengthOfLongestSubstring(_ s: String) -> Int {

        guard !s.isEmpty else { return 0 }

        let chars = [Character](s)
        var (left, right, maxLength) = (0, 0, 0)
        var set = Set<Character>()
        while right < chars.count {
            if set.contains(chars[right]) {
                set.remove(chars[left])
                left += 1
            } else {
                set.insert(chars[right])
                right += 1
                maxLength = max(maxLength, right - left)
            }
        }
        return maxLength
    }
}


let solution = Solution()
print(solution.lengthOfLongestSubstring("abcabcbb"))
print(solution.lengthOfLongestSubstring("bbbbb"))
print(solution.lengthOfLongestSubstring("pwwkew"))
print(solution.lengthOfLongestSubstring("aab"))

