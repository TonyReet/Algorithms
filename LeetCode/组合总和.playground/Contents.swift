import UIKit

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        if candidates.count == 0 {
            return []
        }
        
        var result = [[Int]](), combine = [Int](), candidates = candidates.sorted()
        
        dfs(&candidates, &result, &combine, target ,0)
        
        return result
    }
    
    func dfs(_ candidates: inout [Int], _ result: inout [[Int]], _ combine: inout [Int], _ target: Int,  _ idx: Int){
        guard idx < candidates.count && target >= 0 else {return}
        
        if  target == 0 {
            result.append(combine) // 新增
            return
        }
        
        for index in idx..<candidates.count {
            let newTarget = target - candidates[index]
            if newTarget < 0 {
                break
            }
            
            combine.append(candidates[index])
            dfs(&candidates, &result, &combine, newTarget, index)
            combine.removeLast()
        }
    }
}

let solution = Solution()
//print("测试Test:\(solution.combinationSum([2, 3, 6, 7], 7))")
print("测试Test:\(solution.combinationSum([8, 7, 4, 3], 11))")
