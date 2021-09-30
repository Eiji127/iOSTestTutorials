//
//  PasswordValidatorTests.swift
//  UnitTestExerciseTests
//
//  Created by 白数叡司 on 2021/09/29.
//

import XCTest
@testable import UnitTestExercise

class PasswordValidatorTests: XCTestCase {
    // MARK: - 8文字以上であること
    func test_数字が2文字含まれており_合計7文字入力された場合にfalseが返されること() {
        XCTAssertFalse(validate(password: "abcde12"))
    }
    
    func test_数字が2文字含まれており_合計8文字入力された場合にtrueが返されること() {
        XCTAssertTrue(validate(password: "abcdef12"))
    }
    
    func test_数字が2文字含まれており_合計9文字入力された場合にtrueが返されること() {
        XCTAssertTrue(validate(password: "abcdefg12"))
    }
    
    // MARK: - 数字が2文字以上利用されていること
    func test_数字以外を7文字と_合数字が1文字入力された場合にfalseが返されること() {
        XCTAssertFalse(validate(password: "abcdefg1"))
    }
    
    func test_数字以外を7文字と_合数字が2文字入力された場合にtrueが返されること() {
        XCTAssertTrue(validate(password: "abcdefg12"))
    }
    
    func test_数字以外を7文字と_合数字が3文字入力された場合にtrueが返されること() {
        XCTAssertTrue(validate(password: "abcdefg123"))
    }
    
    
    func validate(password: String) -> Bool {
        if password.count <= 7 {
            return false
        }
        let numString = password.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        return numString.count >= 2
    }
}
