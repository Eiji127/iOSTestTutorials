//
//  4-3_CreationOfOriginalMatcher.swift
//  UnitTestExerciseTests
//
//  Created by 白数叡司 on 2021/10/05.
//

import Nimble

// MARK: - 自作マッチャー(beTeen)

/*
 struct Person: Equatable {
 var name: String
 var age: Int
 }
 */

// ① Predicate<T>を返す関数を定義
func beTeen() -> Predicate<Person> {
    
    // ② expectで与えられた式がactualExpressionに渡される
    return Predicate { (actualExpression: Expression<Person>) throws -> PredicateResult in
        
        // ③ マッチに失敗した際に利用するエラーメッセージを組み立て
        let msg = ExpectationMessage.expectedActualValueTo("be teenager")
        
        // ④ actualExpressionを評価して値を取り出し
        if let actualValue = try actualExpression.evaluate() {
            
            // ⑤ ageプロパティが13から19に収まっていればtrueで成功する
            return PredicateResult(
                bool: (13...19).contains(actualValue.age),
                message: msg
            )
        } else {
            
            // ⑥ 値が取り出せなかった場合は失敗させる
            return PredicateResult(
                status: .fail,
                message: msg.appendedBeNilHint()
            )
        }
    }
}

// MARK: - テストコード

func testBeTeenager() {
    let person = Person(name: "山田", age: 20)
    
    expect(person).to(beTeen())
    // エラー:expected to be teenager, got <Person(name: "山田", age: 20)>
    
    expect(nil).to(beTeen())
    // エラー:expected to be teenager, got <nil> (use beNil() to match nils)
}
