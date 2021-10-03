//
//  3-9_ExceptionTestForErrorHandlings.swift
//  UnitTestExerciseTests
//
//  Created by 白数叡司 on 2021/10/03.
//

import XCTest
@testable import UnitTestExercise

enum OperationError: Error {
    case divisionByZero
}

func divide(_ x: Int, by y: Int) throws -> Int {
    if y == 0 {
        throw OperationError.divisionByZero
    }
    
    return x / y
}

class ExceptionTests: XCTestCase {
    func testDivideWhenDivisionByZero() {
        XCTAssertThrowsError(try divide(3, by: 0)) { error in
            let error = error as? OperationError
            XCTAssertEqual(error, OperationError.divisionByZero)
        }
    }
}
