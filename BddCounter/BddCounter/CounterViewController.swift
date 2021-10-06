//
//  CounterViewController.swift
//  BddCounter
//
//  Created by 白数叡司 on 2021/10/06.
//

import UIKit

class CounterViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var incrementButton: UIButton!
    
    var count: Int = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    // MARK: - Handlers
    
    static func make() -> CounterViewController {
        let storyboard = UIStoryboard(name: "Counter", bundle: nil)
        return storyboard.instantiateInitialViewController() as! CounterViewController
    }
    
    @IBAction func tapIncrementButton(_ sender: Any) {
        count += 1
        updateView()
    }
    
    @IBAction func tapDecrementButton(_ sender: Any) {
        count -= 1
        updateView()
    }
    
    // MARK: - Helpers
    
    private func updateView() {
        countLabel.text = "\(count)"
    }
}
