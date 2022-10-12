import UIKit

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        if nums.count < 2 {
            return
        }

        let len = nums.count
        var leftIndex = len - 2, rightIndex = len - 1, bigIndex = len - 1

        while leftIndex >= 0, nums[leftIndex] >= nums[rightIndex] {
            leftIndex -= 1
            rightIndex -= 1
        }

        if leftIndex >= 0 {
            while rightIndex <= bigIndex {
                if nums[leftIndex] < nums[bigIndex] {
                    nums.swapAt(leftIndex, bigIndex)
                    break
                }

                bigIndex -= 1
            }
        }

        bigIndex = len - 1
        while rightIndex < bigIndex {
            nums.swapAt(rightIndex, bigIndex)

            rightIndex += 1
            bigIndex -= 1
        }
    }
}

let solution = Solution()
//var nums = [1,3,2]//[3,2,1]
//var nums = [2,3,1] //-> [3, 1, 2]
var nums = [3,2,1] //-> [3, 1, 2]
solution.nextPermutation(&nums)
print("测试Test:\(nums)")
