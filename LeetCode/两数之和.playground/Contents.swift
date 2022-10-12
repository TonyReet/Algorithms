class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numMap = [Int: Int]()
        
        for (index, num) in nums.enumerated() {
            if let numIndex = numMap[num] {
                return [numIndex, index]
            }
            
            let result = target - num
            numMap[result] = index
        }
        
        return []
    }
    
    func twoSumProblem(_ a: [Int], k: Int) -> ((Int, Int))? {
      var i = 0
      var j = a.count - 1

      while i < j {
        let sum = a[i] + a[j]
        if sum == k {
          return (i, j)
        } else if sum < k {
          i += 1
        } else {
          j -= 1
        }
      }
      return nil
    }
}

let solution = Solution()
assert(solution.twoSum([2,7,11,15], 9) == [0, 1])
assert(solution.twoSum([3,2,4], 6) == [1, 2])
assert(solution.twoSum([3,3], 6) == [0, 1])
print("测试成功")
