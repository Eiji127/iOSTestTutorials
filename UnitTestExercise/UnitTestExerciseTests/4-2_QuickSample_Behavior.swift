//
//  4-2_QuickSample_Behavior.swift
//  UnitTestExerciseTests
//
//  Created by 白数叡司 on 2021/10/04.
//

import Quick

// MARK: - 修正後

// ① Behaviorを継承した共通の期待する振る舞いを定義
class CountableBehavior: Behavior<Int> {
    override static func spec(_ context: @escaping () -> Int) {
        var counter: Counter!
        var initial: Int!
        // ② パラメータの取り出し、セットアップ
        beforeEach {
            initial = context()
            counter = Counter()
            counter.reset(initial)
            counter.increment()
            counter.increment()
        }
        // ③ アサーション
        it("incrementを2回呼び出したら、現在の値+2されること") {
            XCTAssertEqual(counter.count, initial + 2)
        }
    }
}

class CountableBehaviorSpec: QuickSpec {
    override func spec() {
        describe("Couner") {
            // ④ CountableBehaviorを利用してテスト
            itBehavesLike(CountableBehavior.self) { 0 }
            itBehavesLike(CountableBehavior.self) { 1 }
        }
    }
}

// MARK: - 修正前
/*
class CounterSpec: QuickSpec {
    override func spec() {
        describe("#increment") {
            var counter: Counter!
            beforeEach {
                counter = Counter()
            }
            // ①
            context("初期値が0") {
                it("2回呼び出したら+2されること") {
                    counter.reset(0)
                    counter.increment()
                    counter.increment()
                    XCTAssertEqual(counter.count, 2)
                }
                
            }
            // ②
            context("初期値が1") {
                it("2回呼び出したら+2されること") {
                    counter.reset(1)
                    counter.increment()
                    counter.increment()
                    XCTAssertEqual(counter.count, 3)
                }
            }
        }
    }
}
*/
