import UIKit

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]](), combine = [Int](), nums = nums
        
        dfs(&nums, &result, &combine, 0)
        
        return result
    }
    
    func dfs(_ nums: inout [Int], _ result: inout [[Int]], _ combine: inout [Int], _ idx: Int){
        guard idx < nums.count else {return}
        if idx == nums.count - 1 {
            combine.append(nums[idx]) // 新增
            result.append(combine) // 新增
            combine.removeLast() // 回溯
            return
        }
        
        for index in idx..<nums.count {
            if idx != index {
                nums.swapAt(idx, index)
            }
            
            combine.append(nums[idx])
            dfs(&nums, &result, &combine, idx + 1)
            combine.removeLast()
            
            if idx != index {
                nums.swapAt(idx, index)
            }
        }
    }
}


let solution = Solution()
print("测试Test:\(solution.permute([1, 2, 3]))")
