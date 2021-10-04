//
//  3-10_SetterInjection1.swift
//  UnitTestExerciseTests
//
//  Created by 白数叡司 on 2021/10/03.
//

import XCTest
@testable import UnitTestExercise


protocol PresenterProtocol {}
class Presenter: PresenterProtocol {}

class ViewController: UIViewController {
    private var presenter: PresenterProtocol?
    func inject(presenter: PresenterProtocol) {
        self.presenter = presenter
    }
}

let viewController = UIStoryboard(name: "ViewController", bundle: nil).instantiateInitialViewController() as? ViewController

let presenter = Presenter()
//viewController?.inject(presenter: presenter)
