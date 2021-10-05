//
//  4-3_OriginalValidationByNimble.swift
//  UnitTestExerciseTests
//
//  Created by 白数叡司 on 2021/10/04.
//

//import Nimble
//
//let string = "123-456" // 郵便番号の形式を満たしていない文字列
//
//expect({
//    // ① 郵便番号の正規表現を用意して、一致するか判定
//    let pattern = "^\\d{3}-\\d{4}$"
//    let regex = try! NSRegularExpression(pattern: pattern, options: [])
//    let matches = regex.matches(in: string, options: [],
//                                range: NSMakeRange(0, string.count))
//    // ② 一致すれば成功、そうでなければ失敗
//    if matches.count > 0 {
//        return .succeeded
//    } else {
//        return .failed(reason: "郵便番号の形式ではない。")
//    }
//}).to(succeed())
