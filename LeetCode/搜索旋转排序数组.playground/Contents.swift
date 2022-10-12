import UIKit

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        let len = nums.count
        if len == 0 {
            return -1
        }
        
        if len == 1 {
            return nums.first == target ? 0 : -1
        }
        
        var leftIndex = 0, rightIndex = len - 1
        while leftIndex <= rightIndex {
            let mid = (leftIndex + rightIndex) / 2
            if nums[mid] == target {return mid}
            
            if nums[leftIndex] < nums[mid]{// 左断点小于中间点
                if nums[leftIndex] <= target && target <= nums[mid] {
                    rightIndex = mid - 1
                } else {
                    leftIndex = mid + 1
                }
            } else {
                if nums[mid] <= target && target <= nums[rightIndex] {
                    leftIndex = mid + 1
                } else {
                    rightIndex = mid - 1
                }
            }
        }
        
        return -1
    }
//    func search(_ nums: [Int], _ target: Int) -> Int {
//        let len = nums.count
//        if len == 0 {
//            return -1
//        }
//
//        if len == 1 {
//            return nums.first == target ? 0 : -1
//        }
//
//        var leftIndex = (len + 1)/2 - 1, rightIndex = (len - 1)/2 + 1
//        var leftValue = nums[leftIndex], rightValue = nums[rightIndex]
//
//        while leftIndex >= 0 || rightIndex < len {
//            if leftIndex >= 0 {
//                let leftValueNew = nums[leftIndex]
//                if leftValueNew == target {
//                    return leftIndex
//                } else if target < leftValue && leftValue < leftValueNew {
//                    leftIndex = -1
//                } else {
//                    leftValue = leftValueNew
//                    leftIndex -= 1
//                }
//            }
//
//
//            if rightIndex < len {
//                let rightValueNew = nums[rightIndex]
//                if rightValueNew == target {
//                    return rightIndex
//                } else if target > rightValue && rightValue > rightValueNew {
//                    rightIndex = len
//                } else {
//                    rightValue = rightValueNew
//                    rightIndex += 1
//                }
//            }
//        }
//
//        return -1
//    }
}


let solution = Solution()
print("测试Test:\(solution.search([3,4,5,6,1,2], 2))")
