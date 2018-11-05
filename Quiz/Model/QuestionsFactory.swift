//
//  QuestionsFactory.swift
//  Quiz
//
//  Created by Alex Lopez on 16/10/2018.
//  Copyright © 2018 Cristian Lopez. All rights reserved.
//

import Foundation

class QuestionsFactory {
    
    var questionsBank : QuestionsBank!
    
    init() {
        //Plist Manual
        /*if let path = Bundle.main.path(forResource: "QuestionsBank", ofType: "plist") {
            if let plist = NSDictionary(contentsOfFile: path) {
                let questionData = plist["Questions"] as! [AnyObject]
                
                for question in questionData {
                    if let text = question["question"], let ans = question["answer"] {
                        questions.append(Question(text: text as! String, correctAnswer: ans as! Bool))
                    }
                }
            }
        }*/
        
        //Plist automatic by codable
        do {
            if let url = Bundle.main.url(forResource: "QuestionsBank", withExtension: "plist") {
                let data = try Data(contentsOf: url)
                self.questionsBank = try PropertyListDecoder().decode(QuestionsBank.self, from: data)
            }
        } catch {
            print(error)
        }
    }
    
    func getQuestionAt(index : Int) -> Question? {
        if index < 0 || index >= self.questionsBank.questions.count {
            return nil
        } else {
            return self.questionsBank.questions[index]
        }
    }
    
    func getRandomQuestion() -> Question {
        let index = Int(arc4random_uniform(UInt32(self.questionsBank.questions.count)))
        return self.questionsBank.questions[index]
    }
}
