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
                    vc.incrementButton.tap(repeat: 10)
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
                    vc.incrementButton.tap(repeat: 10)
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
        
        // ⑤ ボタンタップ時にUserDefaultsのキー「count」に値が保存したことのテスト
        describe("現在値の保存") {
            context("現在値が2") {
                
                // 事前にカウントを「2」し、
                // UserDefaultsのキー「count」を0でクリアしておく
                beforeEach {
                    vc.incrementButton.tap(repeat: 2)
                    UserDefaults.standard.set(0, forKey: "count")
                }
                
                context("「+」ボタンをタップ") {       
                    it("現在値「3」がUserDefaultsに保存されること") {
                        vc.incrementButton.tap()
                        
                        // UserDefaultsのキー「count」から値を取得してアサーション
                        let actual = UserDefaults.standard.integer(forKey: "count")
                        expect(actual).to(equal(3))
                    }
                }
                
                context("「-」ボタンをタップ") {
                    it("現在値「1」がUserDefaultsに保存されること") {
                        vc.decrementButton.tap()
                        
                        let actual = UserDefaults.standard.integer(forKey: "count")
                        expect(actual).to(equal(1))
                    }
                }
            }
        }
    }
}

// MARK: - Extensions

extension UIButton {
    func tap(repeat: Int = 1) {
        for _ in 1...`repeat` {
            self.sendActions(for: .touchUpInside)
        }
    }
}
