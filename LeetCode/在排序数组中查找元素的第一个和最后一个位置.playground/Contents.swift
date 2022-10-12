import UIKit

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let notFound = [-1, -1], numLen = nums.count
        if numLen == 0 {
            return notFound
        }
        
        if let first = nums.first, let last = nums.last, target < first || target > last {
            return notFound
        }

        let left = binarySearch(nums, target, true)
        let right = binarySearch(nums, target, false) - 1
        if left <= right && right < numLen && nums[left] == target && nums[right] == target {
            return [left, right]
        }
        
        return result
    }
    
    func binarySearch(_ nums: [Int], _ target: Int, _ lower: Bool) -> Int{
        var left = 0, right = nums.count - 1, result = nums.count
        while left <= right {
            let mid = (left + right) / 2
            if target < nums[mid] || (lower && target <= nums[mid]) {
                right = mid - 1
                result = mid
            } else {
                left = mid + 1
            }
        }
        
        return result
    }

}
//class Solution {
//    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
//        let notFound = [-1, -1], numLen = nums.count
//        if numLen == 0 {
//            return notFound
//        }
//
//        if let first = nums.first, let last = nums.last, target < first || target > last {
//            return notFound
//        }
//
//        var leftP = 0, rightP = numLen - 1, result = [Int]()
//
//        repeat{
//            let mid = (leftP + rightP)/2, leftV = nums[leftP], rightV = nums[rightP], midV = nums[mid]
//
//            if leftV == target {
//                return searchNearlyNums(nums, target, leftP)
//            } else if midV == target {
//                return searchNearlyNums(nums, target, mid)
//            } else if rightV == target {
//                return searchNearlyNums(nums, target, rightP)
//            }else if leftV < target && target < midV {
//                rightP = mid
//            } else if midV < target && target < rightV {
//                leftP = mid
//            }
//        } while (leftP < rightP - 1)
//
//
//        if result.isEmpty {
//            return notFound
//        }
//
//        return result
//    }
//
//    func searchNearlyNums(_ nums: [Int], _ target: Int, _ idx: Int) -> [Int]{
//        var result = [Int]()
//        var tmpIdx = idx
//        while tmpIdx >= 0 && nums[tmpIdx] == target {
//            result.insert(tmpIdx, at: 0)
//            tmpIdx -= 1
//        }
//
//        tmpIdx = idx + 1
//        while tmpIdx < nums.count && nums[tmpIdx] == target {
//            result.append(tmpIdx)
//            tmpIdx += 1
//        }
//
//        if result.count == 1 {
//            return [result.first!, result.first!]
//        } else if result.count > 2 {
//            return [result.first!, result.last!]
//        } else {
//            return result
//        }
//    }
//}

let solution = Solution()
//print("测试Test:\(solution.searchRange([5,7,7,8,8], 6))")
//print("测试Test:\(solution.searchRange([1], 1))")
//print("测试Test:\(solution.searchRange([1,3], 1))")
//print("测试Test:\(solution.searchRange([], 0))")
print("测试Test:\(solution.searchRange([3,3,3], 3))")
print("测试Test:\(solution.searchRange([-3,-2,-1], 0))")
