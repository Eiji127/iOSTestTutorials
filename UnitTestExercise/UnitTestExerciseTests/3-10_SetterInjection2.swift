//
//  3-10_SetterInjection.swift
//  UnitTestExerciseTests
//
//  Created by 白数叡司 on 2021/10/03.
//

import XCTest
@testable import UnitTestExercise


protocol BInput {}
protocol BOutput: AnyObject {}

class A: BOutput {
    private var b: BInput?
    func inject(b: BInput) {
        self.b = b
    }
}

class B: BInput {
    private weak var a: BOutput?
    func inject(a: BOutput) {
        self.a = a
    }
}

// 本当は次のようにコンストラクタインジェクションしたいが、
// 依存の順序が解決できないので、セッターインジェクションとする
// let a = A(b: b)
// let b = B(a: a)

let a = A()
let b = B()
//a.inject(b: b)
//b.inject(a: a)
