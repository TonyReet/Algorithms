import UIKit

var greeting = "Hello, playground"

/*
 给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。

 算法的时间复杂度应该为 O(log (m+n)) 。
 示例 1：

 输入：nums1 = [1,3], nums2 = [2]
 输出：2.00000
 解释：合并数组 = [1,2,3] ，中位数 2
 示例 2：

 输入：nums1 = [1,2], nums2 = [3,4]
 输出：2.50000
 解释：合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5
 */

class Solution {
    /*
     首先我们知道两个数组本身有序递增的，如果是找出任意一个数组的中位数，是很容易，但是我们要找的是 两个正序数组的中位数，也就是说，假设两个数组合并了，此时的中位数才是我们要找的。

     1. 归并法
     基于上面的解题思路，我们先将两个数组合并成一个。这样就直接在新数组找中位数了。

     合并两个有序数组的规则如下：

     如果 nums2 已经清空， 或者 nums1 当前的元素是 小于等于 nums2 当前的元素。则移动 nums1 的元素
     如果 nums1 已经清空， 或者 nums1 当前元素是 大于 nums2 当前的元素。则 移动 nums2 的元素。
     这两个条件是互斥的。

     这个过程 和 88. 合并两个有序数组 一样，之后我们之间取中位数 即可。
     */
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
      var mergeArray = [Int](repeating: 0, count: nums1.count+nums2.count)
      var i = 0
      var j = 0

      for index in 0..<mergeArray.count {

        if (j >= nums2.count) || (i < nums1.count && nums1[i] <= nums2[j])  {
          mergeArray[index] = nums1[i]
          i+=1
        } else  {
          mergeArray[index] = nums2[j]
          j+=1
        }
      }

      if mergeArray.count % 2 == 0 {
        return Double(mergeArray[mergeArray.count/2-1] + mergeArray[mergeArray.count/2]) / 2.0
      } else {
        return Double(mergeArray[mergeArray.count/2])
      }
    }

//    /*
//     2.双指针法\滚动数组
//     如果我们手动模拟一遍 方法1 的归并法，我们可以发现，当移动 (nums1.count + nums2.count)/2 个元素的时候，就已经找到了中位数。
//
//     因为两个数组是有序的，那么都从最小的位置开始移动，移动到中间的时候，移动次数也是数组元素之和的一半。
//
//     因此，我们并不需要额外的数组去合并保存元素。 可以通过 移动 i 和 j 让 i+j == (nums1.count + nums2.count)/2，此时 的最大值就是 中位数。(确保 i 和 j 都是从0开始移动)
//
//     和方法1过程类似。不过需要两个两个临时变量保存 当前值 和 前一个值
//     当到达数组中间的时候，通过判断两个数组个数的奇偶决定中位数。
//     可以使用滚动数组去解决，不过滚动数组只有两个元素。所以直接使用两个指针替代.
//
//     在移动元素的时候，我们让 i 指向 数组1 的起点，让 j 指向 数组2 的起点。
//
//     如果 j 已经越界，那么我们只能移动 i
//     如果 j 和 i 都没有越界，且 num1[i] < nums2[j], 那么我们依然需要移动 i
//     如果 i 已经越界，那么我们移动 j
//     如果 j 和 i 都没有越界，且 num1[i] > nums2[j], 那么我们就移动 j
//     当移动次数达到 (nums1.count + nums2.count)/2 时, 说明我们已经找到了中位数。
//     */
//    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
//      var i = 0, j = 0
//      var perNumber = 0, current = 0
//
//      while i+j <= (nums1.count + nums2.count)/2 {
//        //！ 保留前一个元素
//        perNumber = current
//
//        if (j >= nums2.count) || (i < nums1.count && nums1[i] <= nums2[j])  {
//          current = nums1[i]
//          i+=1
//        } else  {
//          current = nums2[j]
//          j+=1
//        }
//      }
//
//      if (nums1.count + nums2.count) % 2 == 0 {
//        return Double(perNumber + current) / 2.0
//      } else {
//        return Double(current)
//      }
//    }
}

let solution = Solution()
print("测试Test:\(solution.findMedianSortedArrays([1,3], []))")
print("测试Test:\(solution.findMedianSortedArrays([1,3,4], []))")
print("测试Test:\(solution.findMedianSortedArrays([1,3], [2]))")
print("测试Test:\(solution.findMedianSortedArrays([1,2], [3,4]))")
