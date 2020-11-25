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
        ["Four + Two is equal to Six.", "True"],
        ["Five - Three is greater than One.", "True"],
        ["Three + Eight is less than Ten", "False"]
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
        
        let userAnswer = sender.currentTitle // True, False
        let actualAnswer = quiz[questionNumber][1]
        
        if userAnswer == actualAnswer  {
            print("Right!")
        } else {
            print("Wrong!")
        }
        
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        updateUI()
    }
    
    private func updateUI() {
        questionLabel.text = quiz[questionNumber][0]
    }
}

