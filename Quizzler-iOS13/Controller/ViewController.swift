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
    
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var progressBar: UIProgressView!
    @IBOutlet private weak var choiceOne: UIButton!
    @IBOutlet private weak var choiceTwo: UIButton!
    @IBOutlet private weak var choiceThree: UIButton!
    
    private var quizBrain = QuizBrain()
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    // MARK: - Private
    
    @objc
    private func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        //Need to fetch the answers and update the button titles using the setTitle method.
        let answerChoices = quizBrain.getAnswers()
        choiceOne.setTitle(answerChoices[0], for: .normal)
        choiceTwo.setTitle(answerChoices[1], for: .normal)
        choiceThree.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        choiceOne.backgroundColor = .clear
        choiceTwo.backgroundColor = .clear
        choiceThree.backgroundColor = .clear
    }

    // MARK: - IBAction
    
    @IBAction
    private func answerButtonPressed(_ sender: UIButton) {
        var isUserGotItRight = false
        
        if let userAnswer = sender.currentTitle { // True, False
            isUserGotItRight = quizBrain.checkAnswer(userAnswer)
        }

        if isUserGotItRight  {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
                
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
}

