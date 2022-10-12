import UIKit

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted(by: <)
        let len = nums.count
        if len < 3 {
            return []
        }

        var result = [[Int]]()
        for index in 0..<len {
            let targetNum = nums[index]
            if targetNum > 0 {continue}
            if index > 0 && targetNum == nums[index - 1] {continue}
            
            var start = index + 1
            var end = len - 1
            while start < end {
                let startValue = nums[start]
                let endValue = nums[end]
                
                if (startValue + endValue) < -targetNum {
                    start += 1
                } else if (startValue + endValue) > -targetNum {
                    end -= 1
                } else {
                    result.append([targetNum, startValue, endValue])
        
                    while start < end && nums[start] == nums[start + 1] { start += 1}
                    while start < end && nums[end] == nums[end - 1] { end -= 1}
                    start += 1
                    end -= 1
                }
            }
        }
        
        return result
    }
}

let solution = Solution()
//print("测试Test:\(solution.threeSum([-1,0,1,2,-1,-4]))")
//print("测试Test:\(solution.threeSum([-2,0,1,1,2]))")//[-2,1,1][-2,0,2]
print("测试Test:\(solution.threeSum([-2,0,0,2,2]))")//[-2,1,1][-2,0,2]

