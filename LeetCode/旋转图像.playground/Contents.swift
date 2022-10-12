import UIKit

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let len = matrix.count
        var nexMatrix = matrix
        for (rowIndex, row) in matrix.enumerated() {
            for (columIndex, _) in row.enumerated() {
                nexMatrix[columIndex][len - rowIndex - 1] = matrix[rowIndex][columIndex]
            }
        }
        
        matrix = nexMatrix
    }
}
