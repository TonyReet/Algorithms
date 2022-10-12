import UIKit


let numDigitsMap = ["2": "abc", "3": "def",
                    "4":"ghi", "5":"jkl", "6":"mno",
                    "7":"pqrs", "8":"tuv", "9":"wxyz",
                    ]

//// for 循环
//func letterCombinations(_ digits: String) -> [String] {
//    let chars = Array(digits)
//
//    if chars.count < 2 {
//        return [digits]
//    }
//
//    var result = [String]()
//    for char in chars {
//        // 取出数据
//        let number = String(char)
//        guard let letters = numDigitsMap[number] else {continue}
//        let letterList = Array(letters)
//
//        var temp = [String]()
//        for char in letterList {
//            for index in 0..<result.count {
//                temp.append(result[index] + String(char))
//            }
//        }
//        result = temp
//    }
//    return result
//}

// 递归
func letterCombinations(_ digits: String) -> [String] {
    if digits.isEmpty == true {
        return []
    }

    let chars:[String] = Array(digits).compactMap({numDigitsMap[String($0)]})

    if chars.count == 1{
        return Array(chars.first!).compactMap({String($0)})
    }
    
    var result = [String]()
    func loop(_ string: String, index: Int) {
        if chars.count <= index {
            if string.isEmpty == false {
                result.append(string)
            }
            return
        }
        
        for char in chars[index] {
            loop(string + String(char), index: index + 1)
        }
    }
    
    loop("", index: 0)
    return result
}

//private let dict = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
//
// func letterCombinations(_ digits: String) -> [String] {
//     var ans = [String]()
//     for v in digits.map { Int(String($0))! } {
//         ans = (ans.isEmpty ? [""] : ans).flatMap { s in
//             dict[v].map { "\($0)" }.map { s + $0 }
//         }
//     }
//
//     return ans
// }
//}


let result = letterCombinations("2")
