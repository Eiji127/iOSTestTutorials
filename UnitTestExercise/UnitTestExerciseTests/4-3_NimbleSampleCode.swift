//
//  4-3_NimbleSampleCode.swift
//  UnitTestExerciseTests
//
//  Created by 白数叡司 on 2021/10/04.
//

import XCTest
import Nimble
@testable import UnitTestExercise

// MARK: - テスト対象

struct Person: Equatable {
    var name: String
    var age: Int
}

extension Sequence where Element == Person {
    func teens() -> [Person] {
        // ① 19歳が含まれないバグを仕込んでいる
        return self.filter { (13..<19).contains($0.age) }
    }
}

let members = [
    Person(name: "山田", age: 12),
    Person(name: "高橋", age: 13),
    Person(name: "細沼", age: 19),
    Person(name: "佐藤", age: 20),
]

// MARK: - XCTest ver.

func testWithXCTAssert() {
    let teens = members.teens()
    XCTAssertEqual(teens.count, 2)
    XCTAssertTrue(teens.contains(members[1]))
    XCTAssertTrue(teens.contains(members[2]))
}

// MARK: - Nimble ver.

func testWithNimble() {
    let teens = members.teens()
    
    expect(teens).to(haveCount(2))
    expect(teens).to(contain(members[1], members[2]))
}
