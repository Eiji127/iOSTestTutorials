//
//  4-2_QuickSampleCode.swift
//  UnitTestExerciseTests
//
//  Created by 白数叡司 on 2021/10/04.
//

import Quick

// ① Quickをインポート
import Quick
// ② QuickSpecを継承
class BasicSpec: QuickSpec {
    // ③ specメソッドをオーバーライド
    override func spec() {
        // ④ 概要
        describe("String#isEmpty") {
            // ⑤ 条件1:空文字列
            context("when an empty string is given") {
                // ⑥ 期待する結果
                it("returns true") {
                    // ⑦ 結果の検証
                    XCTAssertTrue("".isEmpty) }
            }
            // ⑤ 条件2:ブランク文字列
            context("when string is blank") {
                it("returns false") {
                    XCTAssertFalse(" ".isEmpty)
                }
            }
        }
    }
}
