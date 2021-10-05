//
//  4-3_AsynchronizedProcessingByNimble.swift
//  UnitTestExerciseTests
//
//  Created by 白数叡司 on 2021/10/05.
//

import Nimble

// MARK: - テスト対象

func echo(_ message: String, _ complition: @escaping (String) -> Void) {
    // 0.5秒後にmessageの末尾に"!!"を付与したものをコールバックで返す
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        complition("\(message)!!")
    }
}

// MARK: - waitUntil関数を使用したアサーション

//// ① タイムアウトになるかdoneが呼び出されるまで待機する
//waitUntil { done in
//    // ② テスト対象の非同期関数を呼び出し
//    echo("Hello") { message in
//        // ③ 通常のNimbleアサーションで検証
//        expect(message).to(equal("Hello!!"))
//        // ④ doneを呼び出すことで処理を再開させる
//        done()
//    }
//}
//// done()が呼び出されるかタイムアウトするまで到達しない

// MARK: - toEventuallyマッチャーを使用したアサーション

//// ① 結果を格納する変数を用意
//var actual: String = ""
//
//// ② テスト対象の非同期処理を呼び出し、結果をactualに格納
//echo("Hello") { message in
//    actual = message
//}
//
//// ③ actualが「equal("Hello!!")」を満たすか、タイムアウトするまで待機する
//expect(actual).toEventually(equal("Hello!!"))
//
//// toEventuallyに与えたマッチャーを満たすか、タイムアウトするまで到達しない
