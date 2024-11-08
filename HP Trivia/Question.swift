//
//  Question.swift
//  HP Trivia
//
//  Created by Mark Santoro on 11/8/24.
//

import Foundation

struct Question: Codable {
    let id: Int
    let question: String
    var answers: [String: Bool] = [:]
    let book: Int
    let hint: String
    
    enum QuestionKeys: String, CodingKey {
        case id
        case question
        case answer
        case wrong
        case book
        case hint
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: QuestionKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        question = try container.decode(String.self, forKey: .question)
        book = try container.decode(Int.self, forKey: .book)
        hint = try container.decode(String.self, forKey: .hint)

        // answers already initialized so no error if ommitted but we still need to decode it
        
        let correctAnswer = try container.decode(String.self, forKey: .answer)
        answers[correctAnswer] = true
        
        let wrongAnswers = try container.decode([String].self, forKey: .wrong)
        for answer in wrongAnswers {
            answers[answer] = false
        }

        /*
         This is what the dictionary looks like
         answers:
         {
         // key:value
         "The Boy Who Lived": true
         "The Kid Who Survived": false
         "The Baby Who Beat The Dark Lord": false
         "The Scrawny Teenager": false
        
         }
         */
        
        
    }
    
    
    
}

