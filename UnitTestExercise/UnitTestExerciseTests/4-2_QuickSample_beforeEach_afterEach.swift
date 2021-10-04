//
//  4-2_QuickSample_beforeEach_afterEach.swift
//  UnitTestExerciseTests
//
//  Created by 白数叡司 on 2021/10/04.
//

import Quick

// MARK: - テスト対象
struct Counter {
    var count: Int = 0
    
    mutating func increment() {
        count += 1
    }
    
    mutating func reset(_ value: Int = 0) {
        count = value
    }
}

// MARK: - テストコード
class CounterSpec: QuickSpec {
    override func spec() {
        describe("Counter") {
            
            // ① テスト用の定数
            var counter: Counter!
            
            // ② この階層以下に定義されたitの直前に呼ばれる
            beforeEach {
                counter = Counter()
            }
            
            it("初期値は0であること") {
                XCTAssertEqual(counter.count, 0)
            }
            
            describe("#increment") {
                context("1回だけ呼び出し") {
                    it("countが1になること") {
                        counter.increment()
                        XCTAssertEqual(counter.count, 1)
                    }
                }
                context("2回だけ呼び出し") {
                    counter.increment()
                    counter.increment()
                    XCTAssertEqual(counter.count, 2)
                }
            }
            
            // ③ この階層以下に定義されたitの直後に呼ばれる
            afterEach {
                // beforeEachで新たなインスタンスを生成しているので本来は不要
                counter.reset()
            }
        }
    }
}


