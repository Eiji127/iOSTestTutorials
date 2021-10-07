//
//  CounterViewConrollerTests2.swift
//  BddCounterTests
//
//  Created by 白数叡司 on 2021/10/06.
//

import Quick
import Nimble
@testable import BddCounter

// MARK: - テストコード

class CounterViewSpec: QuickSpec {
    override func spec() {
        var vc: CounterViewController!
        
        // ① テスト対象のセットアップ
        beforeEach {
            vc = CounterViewController.make()
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = vc
            window.makeKeyAndVisible()
        }
        
        // ② 初期表示のテスト
        describe("初期表示") {
            it("カウントが「0」であること") {
                expect(vc.countLabel.text).to(equal("0"))
            }
            it("「-」ボタンが非活性であること") {
                expect(vc.decrementButton.isEnabled).to(beFalse())
            }
            it("「+」ボタンが活性であること") {
                expect(vc.incrementButton.isEnabled).to(beTrue())
            }
        }
        
        // ③ 「+」ボタンをタップした時のテスト
        describe("「+」ボタンをタップ") {
            context("現在値が「0」") {
                it("カウンタが「1」に増えること") {
                    vc.incrementButton.tap()
                    expect(vc.countLabel.text).to(equal("1"))
                }
                it("下限値でなくなるので「-」ボタンが活性になること") {
                    vc.incrementButton.tap()
                    expect(vc.decrementButton.isEnabled).to(beTrue())
                }
            }
            context("上限に達した場合") {
                beforeEach {
                    // ① 「+」ボタンを10回タップ
                    for _ in 1...10 {
                        vc.incrementButton.tap()
                    }
                }
                it("上限値なので「+」ボタンが非活性になること") {
                    expect(vc.countLabel.text).to(equal("10"))
                    expect(vc.incrementButton.isEnabled).to(beFalse())
                }
            }
        }
        
        // ④ 「-」ボタンをタップしたときのテスト
        describe("「-」ボタンをタップ") {
            context("現在値が「1」") {
                beforeEach {
                    // 事前に「1」にしておく
                    vc.incrementButton.tap()
                }
                it("カウンタが「0」に減ること") {
                    vc.decrementButton.sendActions(for: .touchUpInside)
                    expect(vc.countLabel.text).to(equal("0"))
                }
                it("下限値になるので「-」ボタンが非活性になること") {
                    vc.decrementButton.tap()
                    expect(vc.decrementButton.isEnabled).to(beFalse())
                }
            }
            context("現在値が「10」(上限値)") {
                beforeEach {
                    for _ in 1...10 {
                        vc.incrementButton.tap()
                    }
                    vc.decrementButton.tap()
                }
                it("カウンタが「9」に減ること") {
                    expect(vc.countLabel.text).to(equal("9"))
                }
                it("上限値でなくなるので「+」ボタンが活性になること") {
                    expect(vc.incrementButton.isEnabled).to(beTrue())
                }
            }
        }
    }
}

// MARK: - Extensions

extension UIButton {
    func tap() {
        self.sendActions(for: .touchUpInside)
    }
}
