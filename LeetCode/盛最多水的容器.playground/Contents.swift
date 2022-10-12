import UIKit

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        let len = height.count

        if len < 2 {
            return 0
        }
        
        var left = 0
        var right = len - 1
        var maxWater = 0


        while left < right && right >= 0 && left < len {
            maxWater = max(maxWater, (right - left)*min(height[left], height[right]))
            
            height[left] > height[right] ? (right -= 1) : (left += 1)
        }

        return maxWater
    }
}

let solutiaon = Solution()
print("测试Test：\(solutiaon.maxArea([1,8,6,2,5,4,8,3,7]))")
print("测试Test：\(solutiaon.maxArea([1,1]))")
