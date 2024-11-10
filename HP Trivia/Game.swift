//
//  Game.swift
//  HP Trivia
//
//  Created by Mark Santoro on 11/9/24.
//

import Foundation

@MainActor // force to run on main thread
class Game: ObservableObject {
    @Published var gameScore = 0
    @Published var questionScore = 5
    @Published var recentScores = [0,0,0]
    
    private var allQuestions: [Question] = []
    private var answeredQuestions: [Int] = []
    
    var filteredQuestions: [Question] = []
    var currentQuestion = Constants.previewQuestion
    var answers: [String] = []
    var correctAnswer: String{
        currentQuestion.answers.first(where: {$0.value == true})!.key
    }
    
    init(){
        decodeQuestions()
    }
    
    func startGame() {
        gameScore = 0
        questionScore = 5
        answeredQuestions = []
        
    }
    
    func filterQuestions(to books: [Int]) {
        filteredQuestions = allQuestions.filter{books.contains($0.book)}
    }
    
    func newQuestion() {
        if answeredQuestions.count == filteredQuestions.count{
            answeredQuestions = []
        }
        
        if filteredQuestions.isEmpty {
            return
        }
        
        var potentialQuestion = filteredQuestions.randomElement()!
        while answeredQuestions.contains(potentialQuestion.id){
            potentialQuestion = filteredQuestions.randomElement()!
            
        }
        currentQuestion = potentialQuestion
        
        answers = []
        
        for answer in currentQuestion.answers.keys {
            answers.append(answer)
        }
        
        answers.shuffle()
        
        questionScore = 5
        
    }
    
    func correct() {
        answeredQuestions.append(currentQuestion.id)
    
        gameScore += questionScore
    }
    
    func endGame() {
        recentScores[2] = recentScores[1]
        recentScores[1] = recentScores[0]
        recentScores[0] = gameScore
    }
    
    /*
     enfGame() example:
     recent scores: 33, 27, 15
     new game, new score = 50
     
     in end game, move 27 to 15 spot, move 33 to 27 spot, move 50 to 33 spot.
     score = 15 is removed
     
     */
    
    private func decodeQuestions() {
        if let url = Bundle.main.url(forResource: "trivia", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                allQuestions = try decoder.decode([Question].self, from: data)
                filteredQuestions = allQuestions
                
            } catch {
                print("Error decoding json data \(error)")
            }
            
            
        }
            
    }
    
}
