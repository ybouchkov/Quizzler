//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets & Properties
    
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var progressBar: UIProgressView!
    @IBOutlet private weak var trueButton: UIButton!
    @IBOutlet private weak var falseButton: UIButton!
    
    let quiz = [
        "Four + Two is equal to Six.",
        "Five - Three is greater than One.",
        "Three + Eight is less than Ten"
    ]
    
    var questionNumber = 0
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    // MARK: - Private
    
    // MARK: - IBAction
    
    @IBAction
    private func answerButtonPressed(_ sender: UIButton) {
        questionNumber += 1
        updateUI()
    }
    
    private func updateUI() {
        questionLabel.text = quiz[questionNumber]
    }
}

