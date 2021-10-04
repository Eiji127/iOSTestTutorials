//
//  3-10_StabForTestDoubles.swift
//  UnitTestExerciseTests
//
//  Created by 白数叡司 on 2021/10/03.
//

import XCTest
@testable import UnitTestExercise

// ログイン状態に応じてダイアログの表示・非表示を切り替える例
/*
 ①は、本物のコンポーネントではなくスタブと差し替えられるように protocol を宣言します。
 ②は、代替となるコンポーネントのスタブです。
 ③は、dialogManager.shouldShowLoginDialog の条件分岐を制御するために、isLoggedIn
      が固定値を返却するように設定したstubAuthManagerをDIしている
 */

// ①
protocol AuthManagerProtocol {
    var isLoggedIn: Bool { get }
}

// ②
class StubAuthManager: AuthManagerProtocol {
    var isLoggedIn: Bool = false
}

class DialogManager {
    // ①, ②
    private let authManager: AuthManagerProtocol
    init(authManager: AuthManagerProtocol) {
        self.authManager = authManager
    }
    
    var shouldShowLoginDialog: Bool {
        return !authManager.isLoggedIn
    }
}

class DialogManagerTests: XCTestCase {
    func testShowLoginDialog_ログイン済み() {
        let stubAuthManager = StubAuthManager()
        stubAuthManager.isLoggedIn = true // ③
        let dialogManager = DialogManager(authManager: stubAuthManager)
        
        XCTAssertFalse(dialogManager.shouldShowLoginDialog)
    }
    
    func testShowLoginDialog_未ログイン() {
        let stubAuthManager = StubAuthManager()
        stubAuthManager.isLoggedIn = false // ③
        let dialogManager = DialogManager(authManager: stubAuthManager)
        
        XCTAssertTrue(dialogManager.shouldShowLoginDialog)
    }
}
