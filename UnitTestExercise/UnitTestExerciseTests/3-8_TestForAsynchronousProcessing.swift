//
//  3-8_TestForAsynchronousProcessing.swift
//  UnitTestExerciseTests
//
//  Created by 白数叡司 on 2021/10/01.
//

import XCTest
@testable import UnitTestExercise

func asyncString(completion: ((String) -> ())?) {
    DispatchQueue.global().async {
        sleep(3)
        
        completion?("文字列A")
    }
}

class AsyncTests: XCTestCase {
    func testAsyncString() {
        // 非同期処理の待機と完了を表現するためのインスタンス
        // descriptionは任意のもので構わない
        let exp = XCTestExpectation(description: "Async String")
        
        // 非同期処理の関数の呼び出し
        asyncString { string in
            XCTAssertEqual(string, "文字列A")
            exp.fulfill() // 期待した処理が行われたとしてマークする
        }
        
        // 待機を行うXCTestExpectationのインスタンスを指定する
        // timeoutで指定した5秒以内にexpのfulfillが呼び出されない場合、
        // このテストは失敗となる。
        wait(for: [exp], timeout: 5.0)
    }
}
