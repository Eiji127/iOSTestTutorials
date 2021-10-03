//
//  3-10_ConstractorInjection.swift
//  UnitTestExerciseTests
//
//  Created by 白数叡司 on 2021/10/03.
//

import XCTest
@testable import UnitTestExercise


protocol LoggerProtocol {
    func sendLog(message: String)
}

class Logger: LoggerProtocol {
    func sendLog(message: String) {
        // 本番用のログ送信の実装
    }
}

class DebugLogger: LoggerProtocol {
    func sendLog(message: String) {
        // デバッグ用のログ送信の実装
    }
}

class Calculator {
    // LoggerProtocolに準拠したコンポーネントと置き換え可能な形
    private let logger: LoggerProtocol
    
    init(logger: LoggerProtocol) {
        self.logger = logger
    }
}

let logger = Logger()
// Debug用のLoggerを代入することも可能！！
// let debugLogger = DebugLogger()
let calculator = Calculator(logger: logger)
