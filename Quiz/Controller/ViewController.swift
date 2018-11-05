//
//  ViewController.swift
//  Quiz
//
//  Created by Alex Lopez on 10/10/2018.
//  Copyright © 2018 Cristian Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var labelQuestionNumber: UILabel!
    @IBOutlet weak var progressBar: UIView!
    
    var currentScore = 0
    var currentQuestionID = 0
    var correctQuestionsAnswerd = 0
    var currentQuestion : Question!
    
    let factory = QuestionsFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
    }

    @IBAction func buttonAnswer(_ sender: UIButton) {
        var isCorrect : Bool
        if sender.tag == 1 {
            isCorrect = (self.currentQuestion.answer == true)
        } else {
            isCorrect = (self.currentQuestion.answer == false)
        }
        
        if isCorrect {
            self.correctQuestionsAnswerd += 1
            self.currentScore += 100
            ProgressHUD.showSuccess("Correct")
        } else {
            ProgressHUD.showError("Incorrecto")
        }
        
        askNextQuestion()
        updateUIElements()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.default
    }
    
    //Custom functions
    
    func startGame() {
        currentScore = 0
        currentQuestionID = 0
        correctQuestionsAnswerd = 0
        
        self.factory.questionsBank.questions.shuffle()
        
        self.askNextQuestion()
        
        self.updateUIElements()
    }
    
    func askNextQuestion() {
        if let newQuestion = factory.getQuestionAt(index: currentQuestionID) {
            self.currentQuestion = newQuestion
            self.labelQuestion.text = self.currentQuestion.question
            self.currentQuestionID += 1
        } else { //No more questions
            gameOver()
        }
    }
    
    func gameOver() {
        let alert = UIAlertController(title: "Fin de la partida", message: "Has acertado \(self.correctQuestionsAnswerd)/\(self.currentQuestionID)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Volver a empezar", style: .default) { (_) in
            self.startGame()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func updateUIElements() {
        self.labelScore.text = "Score: \(self.currentScore)"
        self.labelQuestionNumber.text = "\(self.currentQuestionID)/\(self.factory.questionsBank.questions.count)"
        
        for constraint in self.progressBar.constraints {
            if constraint.identifier == "barWidth" {
                constraint.constant = self.view.frame.size.width / CGFloat(self.factory.questionsBank.questions.count) * CGFloat(self.currentQuestionID)
            }
        }
    }
}

