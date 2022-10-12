import UIKit


 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }
 
class Solution {
    // for循环
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }

        if list2 == nil {
            return list1
        }

        var l1 = list1
        var l2 = list2
        var dummy = ListNode(-1)
        var head: ListNode? = dummy
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val  {
                head?.next = l1
                l1 = l1!.next
            } else {
                head?.next = l2
                l2 = l2!.next
            }

            head = head?.next
        }

        head?.next = l1 == nil ? l2 : l1
        return dummy.next
    }
}

var head: ListNode? = ListNode(1)
let head1 = ListNode(2)
let head2 = ListNode(4)
head?.next = head1
head1.next = head2

var headTwo: ListNode? = ListNode(1)
let headTwo1 = ListNode(3)
let headTwo2 = ListNode(5)
headTwo?.next = headTwo1
headTwo1.next = headTwo2

let solution = Solution()

//while head != nil {
//    print("测试Test1:\(head?.val)")
//    head = head?.next
//}
//
//while headTwo != nil {
//    print("测试Test2:\(headTwo?.val)")
//    headTwo = headTwo?.next
//}

let result = solution.mergeTwoLists(head, headTwo)
var result1 = result
print("测试Test3:\(result1)")
while result1 != nil {
    print("测试Test2:\(result1?.val)")
    result1 = result1?.next
}
