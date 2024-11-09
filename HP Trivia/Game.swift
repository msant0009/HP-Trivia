//
//  Game.swift
//  HP Trivia
//
//  Created by Mark Santoro on 11/9/24.
//

import Foundation

@MainActor // force to run on main thread
class Game: ObservableObject {
    private var allQustions: [Question] = []
    private var answeredQustions: [Int] = []
    
    var filteredQuestions: [Question] = []
    var currentQuestion = Constants.previewQuestion
    
    init(){
        decodeQustions()
    }
    
    func filterQuestions(to books: [Int]) {
        filteredQuestions = allQustions.filter{books.contains($0.book)}
    }
    
    func newQuestion() {
        if answeredQustions.count == filteredQuestions.count{
            answeredQustions = []
        }
        
        if filteredQuestions.isEmpty {
            return
        }
        
        var potentialQuestion = filteredQuestions.randomElement()!
        while answeredQustions.contains(potentialQuestion.id){
            potentialQuestion = filteredQuestions.randomElement()!
            
        }
        currentQuestion = potentialQuestion
        
    }
    
    private func decodeQustions() {
        if let url = Bundle.main.url(forResource: "trivia", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                allQustions = try decoder.decode([Question].self, from: data)
                filteredQuestions = allQustions
                
            } catch {
                print("Error decoding json data \(error)")
            }
            
            
        }
            
    }
    
}
