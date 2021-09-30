//
//  LifecycleOfXCTest.swift
//  UnitTestExerciseTests
//
//  Created by 白数叡司 on 2021/09/30.
//
import XCTest
@testable import UnitTestExercise

class SampleTests: XCTestCase {
    override class func setUp() {
        // setUp() のクラスメソッドです。
        // こちらのsetUp()はSampleTestsが初期化される際に一度実行され、
        // 最初のテストメソッドが実行される前に呼び出されます。
        // ここで全体的な初期化を行います。
        super.setUp()
    }
    
    override func setUp() {
        // setUp() のインスタンスメソッドです。
        // こちらのsetUp()は各テストメソッドが実行される前にそれぞれ呼び出されます。
        // ここで各テストメソッドごとの初期化を行います。
        super.setUp()
    }
    
    func testX() {}
    
    func testY() {
        // 7
        // インスタンスメソッドのtearDown()が呼び出される前に実行されます。
        addTeardownBlock {
        }
    }
    
    override func tearDown() {
        // tearDown() のインスタンスメソッドです。
        // こちらのtearDown()は各テストメソッドが実行された後にそれぞれ呼び出されます。
        // ここで各テストメソッドごとの後処理を行います。
        super.tearDown()
    }
    
    override class func tearDown() {
        // tearDown() のクラスメソッドです。
        // こちらのtearDown()はSampleTestsが破棄される際に一度実行され、
        // 最後のテストメソッドが実行された後に呼び出されます。
        // ここで全体的な後処理を行います。
        super.tearDown()
    }
}
