//
//  3-10_MockForTestDouble.swift
//  UnitTestExerciseTests
//
//  Created by 白数叡司 on 2021/10/03.
//

import XCTest
@testable import UnitTestExercise

// 電卓にロガーを仕込む例
/*
① テスト対象が依存するコンポーネント(のメソッド)を使用したかを確認するために、モックは「それを使用したか」「何回使用したか」「使用した際に用いた引数はなんだったか」などを記録する
 ② モックに記録させた情報をテスト側で検査している
 
 */

// LoggerProtocolは他のファイルですでに定義しているためコメントアウト↓
/*
protocol LoggerProtocol {
    func sendLog(message: String)
}
*/

class MockLogger: LoggerProtocol {
    // ①
    var invokedSendLog = false
    var invokedSendLogCount = 0
    var sendLogProperties: [String] = []
    
    func sendLog(message: String) {
        invokedSendLog = true
        invokedSendLogCount += 1
        sendLogProperties.append(message)
    }
}

class Calculator2 {
    private let logger: LoggerProtocol
    
    init(logger: LoggerProtocol) {
        self.logger = logger
    }
    
    // 計算の実行を最後にまとめて行うためのenum型
    private enum CalcuAction {
        case add(Int)
        // 引き算、割り算などの演算方法を追加されいくはず！
    }
    
    private var calcActions: [CalcuAction] = []
    
    // 電卓において計算の実行は最後に行いたいので、calcActionsとして
    // 行いたい計算方法を蓄積する
    func add(num: Int) {
        calcActions.append(.add(num))
    }
    
    func calc() -> Int {
        logger.sendLog(message: "Start calc.")
        
        var total = 0
        
        // 蓄積されたcalcActionsをもとに、実際に計算を行っていく処理
        calcActions.forEach { calcAction in
            switch calcAction {
            case .add(let num):
                logger.sendLog(message: "Add \(num)")
                total += num
            }
        }
        
        logger.sendLog(message: "Total is \(total)")
        logger.sendLog(message: "Finish calc.")
        return total
    }
}

class CalculatorTests: XCTestCase {
    func testAdd() {
        let mockLogger = MockLogger()
        let calculator = Calculator2(logger: mockLogger)
        let expectedSendMessages = [
            "Start calc.",
            "Add 1",
            "Total is 1",
            "Finish calc."
        ]
        
        calculator.add(num: 1)
        
        XCTAssertEqual(calculator.calc(), 1)
        // ②
        XCTAssertTrue(mockLogger.invokedSendLog)
        XCTAssertEqual(mockLogger.invokedSendLogCount, 4)
        XCTAssertEqual(mockLogger.sendLogProperties, expectedSendMessages)
    }
}

