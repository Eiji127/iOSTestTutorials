//
//  CounterViewControllerTests.swift
//  BddCounterTests
//
//  Created by 白数叡司 on 2021/10/06.
//

import XCTest
@testable import BddCounter

class CounterViewControllerTests: XCTestCase {
    
    func testIncrementButton() {
        
        // ① テスト対象のViewControllerを表示させる
        let vc = CounterViewController.make()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = vc
        window.makeKeyAndVisible()
        
        // ② 初期のカウントは「0」であること
        XCTAssertEqual(vc.countLabel.text, "0")
        
        // ③ 「+」ボタンをタップするとカウントが「1」に変化すること
        vc.incrementButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(vc.countLabel.text, "1")
    }
}
