//
//  Question.swift
//  Quiz
//
//  Created by Alex Lopez on 12/10/2018.
//  Copyright © 2018 Cristian Lopez. All rights reserved.
//

import Foundation

class Question : CustomStringConvertible, Codable{
    
    let question: String
    let answer: Bool
    
    enum CodingKeys : String, CodingKey {
        case question = "question"
        case answer = "answer"
    }
    
    //To String like Java
    var description : String {
        return "Question: \(self.question), Answer: \(self.answer)"
    }
    
    init(text: String, correctAnswer: Bool) {
        self.question = text
        self.answer = correctAnswer
    }
}

struct QuestionsBank : Codable {
    var questions : [Question]
}
