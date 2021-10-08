//
//  CounterSpec.swift
//  BddCounterTests
//
//  Created by 白数叡司 on 2021/10/08.
//

import Quick
import Nimble
@testable import BddCounter

class CounterSpec: QuickSpec {
    override func spec() {
        
        describe("#init") {
            context("引数なしで初期化") {
                it("countが「0」であること") {
                    expect(Counter().count).to(equal(0))
                }
            }
            context("引数「5」で初期化") {
                it("countが「5」であること") {
                    expect(Counter(count: 5).count).to(equal(5))
                }
            }
        }
        
        describe("#increment / #decrement") {
            context("現在値が「5」") {
                var counter: Counter!
                
                beforeEach {
                    counter = Counter(count: 5)
                }
                it("incrementすると6になること") {
                    counter.increment()
                    expect(counter.count).to(equal(6))
                }
                it("decrementすると4になること") {
                    counter.decrement()
                    expect(counter.count).to(equal(4))
                }
            }
        }
        
        describe("#isLowerLimit") {
            context("現在値が「0」") {
                it("trueを返すこと") {
                    expect(Counter(count: 0).isLowerLimit).to(beTrue())
                }
            }
            context("現在値が「1」以上") {
                it("falseを返すこと") {
                    expect(Counter(count: 1).isLowerLimit).to(beFalse())
                }
            }
        }
        
        describe("#isUpperLimit") {
            context("現在値が「10」") {
                it("trueを返すこと") {
                    expect(Counter(count: 10).isUpperLimit).to(beTrue())
                }
            }
            context("現在値が「10」未満") {
                it("falseを返すこと") {
                    expect(Counter(count: 9).isUpperLimit).to(beFalse())
                }
            }
        }
        
    }
}
