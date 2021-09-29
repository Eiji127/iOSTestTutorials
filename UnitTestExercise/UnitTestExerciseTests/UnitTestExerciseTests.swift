//
//  UnitTestExerciseTests.swift
//  UnitTestExerciseTests
//
//  Created by 白数叡司 on 2021/09/29.
//

import XCTest
@testable import UnitTestExercise

class UnitTestExerciseTests: XCTestCase {

    
    static func validate(password: String) -> Bool {
        if password.count <= 7 {
            return false
        }
        let numString = password.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        return numString.count >= 2
    }

}
