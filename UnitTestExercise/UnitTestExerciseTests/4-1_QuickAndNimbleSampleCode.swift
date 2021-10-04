//
//  4-1_QuickAndNimbleSampleCode.swift
//  UnitTestExerciseTests
//
//  Created by 白数叡司 on 2021/10/04.
//

//import Quick
//import Nimble
//
//class ValidatorSpec: QuickSpec {
//    override func spec() {
//        // ① Quickによるテストの構造化
//        describe("validatePassword関数") {
//            context("8文字未満") {
//                it("falseを返す") {
//
//                    // ② Nimbleによるアサーション
//                    expect(validatePassword("1234567")).to(beFalse())
//                }
//            }
//            context("8文字以上") {
//                context("含まれる数字が2文字未満") {
//                    it("falseを返す") {
//                        expect(validatePassword(abcdefg1)).to(beFalse())
//                    }
//                }
//                context("含まれている数字が2文字以上") {
//                    it("trueを返す") {
//                        expect(validatePassword("abcdefg12")).to(beTrue())
//                    }
//                }
//            }
//        }
//    }
//}
