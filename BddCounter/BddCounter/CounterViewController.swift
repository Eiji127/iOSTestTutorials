//
//  CounterViewController.swift
//  BddCounter
//
//  Created by 白数叡司 on 2021/10/06.
//

import UIKit

class Counter {
    private (set) var count: Int
    
    var isLowerLimit: Bool {
        return count == 0
    }
    var isUpperLimit: Bool {
        return count == 10
    }
    
    init(count: Int = 0) {
        self.count = count
    }
    
    func increment() {
        count += 1
    }
    
    func decrement() {
        count -= 1
    }
}

class CounterViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var incrementButton: UIButton!
    
    var count: Int = 0
    
    var counter = Counter()
    
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
        counter.increment()
        updateView()
    }
    
    @IBAction func tapDecrementButton(_ sender: Any) {
        counter.decrement()
        updateView()
    }
    
    // MARK: - Helpers
    
    private func updateView() {
        countLabel.text = "\(counter.count)"
        // 「-」ボタンの活性制御
        decrementButton.isEnabled = !counter.isLowerLimit
        
        // 「+」ボタンの活性制御
        incrementButton.isEnabled = !counter.isUpperLimit
    }
}
