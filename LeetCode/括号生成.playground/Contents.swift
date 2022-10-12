import UIKit

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
      if n == 0 {return [""]}

    var result = [String]()
    func _generate(_ s: String, _ left:Int, _ right:Int, _ n:Int) {
        if left == n && right == n {
            result.append(s);
            return;
        }

        if left < n {
            _generate(s + "(", left + 1, right, n)
        }

        if left > right {
            _generate(s + ")", left, right + 1, n)
        }
    }

      _generate("", 0, 0, n)

      return result
    }
}
