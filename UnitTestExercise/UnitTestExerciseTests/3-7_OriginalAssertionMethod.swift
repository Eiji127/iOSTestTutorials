//
//  3-7_OriginalAssertionMethod.swift
//  UnitTestExerciseTests
//
//  Created by 白数叡司 on 2021/09/30.
//
import XCTest
@testable import UnitTestExercise

extension String {
    func isOnlyNumeric() -> Bool {
        // 文字列を.decimalDigitsのみでトリミングした場合に存在する文字の数が0個以下
        return self.trimmingCharacters(in: .decimalDigits).count <= 0
    }
}

func assertOnlyNumeric(string: String,
                       file: StaticString = #file,
                       line: UInt = #line) {
    XCTAssertTrue(
        string.isOnlyNumeric(),
        "\"\(string)\" is not only numeric.",
        file: file,
        line: line)
}

class NumericStringTests: XCTestCase {
    func testIsOnlyNumericString() {
        let numericStr = "a0123456789"
        assertOnlyNumeric(string: numericStr)
    }
}
