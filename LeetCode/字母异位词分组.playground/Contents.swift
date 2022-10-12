import UIKit

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var resultDic = [String: [String]]()
        
        for str in strs {
            let strKey = String(str.sorted())
            var value: [String]? = resultDic[strKey]
            if value != nil {
                value!.append(str)
                resultDic[strKey] = value!
            } else {
                resultDic[strKey] = [str]
            }
        }
        
        return Array(resultDic.values)
    }
}

let solution = Solution()
print("测试Test:\(solution.groupAnagrams(["eat","tea","tan","ate","nat","bat"]))")
