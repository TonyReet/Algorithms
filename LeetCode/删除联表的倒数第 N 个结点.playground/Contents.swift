import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var fast: ListNode? = dummy
        var slow: ListNode? = dummy
        
        for _ in 0..<n {
            if let node = fast?.next {
                fast = node
            }
        }
        while fast?.next != nil {
            slow = slow!.next
            fast = fast!.next
        }
        
        // remove
        slow!.next = slow!.next!.next
        return dummy.next
    }
}


let head = ListNode(1)
let head1 = ListNode(2)
let head2 = ListNode(3)
let head3 = ListNode(4)
let head4 = ListNode(5)
head.next = head1
head1.next = head2
head2.next = head3
head3.next = head4

let solution = Solution()
var result = solution.removeNthFromEnd(head, 2)
print("测试Test:\(result)")
//while result?.next != nil {
//    print("测试Test:\(result?.val)")
//    result = result?.next
//}
