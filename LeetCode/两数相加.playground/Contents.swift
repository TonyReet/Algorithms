import UIKit


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let resultNode = ListNode(0)
        var head = resultNode
        var carry = 0
        
        var l1 = l1
        var l2 = l2
        while (l1 != nil || l2 != nil){
            let val = l1?.val ?? 0 + (l2?.val ?? 0) + carry
            carry = val / 10
            
            head.val = val % 10
            
            if let l1Nex = l1 { l1 = l1Nex}
            if let l2Nex = l2 { l2 = l2Nex}
            if let next = head.next { head = next}
        }
        
        if carry > 0 {
            head.next = ListNode(carry)
        }
        return resultNode
    }
}

let solution = Solution()
print(solution)
