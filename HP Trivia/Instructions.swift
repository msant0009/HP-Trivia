//
//  Instructions.swift
//  HP Trivia
//
//  Created by Mark Santoro on 10/31/24.
//

import SwiftUI

struct Instructions: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack{
            InfoBackgroundImage() // see constants file
            
            VStack{
                Image("appiconwithradius")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .padding(.top)
                
                ScrollView {
                Text("How To Play")
                        .font(.largeTitle)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Welcome to HP TRivia! In this game, you will be asked random questions from the HP books and you must guess correctly or you will lose points!😱")
                            .padding([.horizontal, .bottom])
                        
                        Text("Each question is worth 5 points, but if you get a wrong answer, you lose 1 point.")
                            .padding([.horizontal, .bottom])
                        Text("If you are struggling with a question, there is an option to reveal a hint or reveal a book that answers the question but beware! Using these also minuses 1 popint each.")
                            .padding([.horizontal, .bottom])
                        Text("When you select the correct answer, you will be rewarded all of the points left for that question and they will be added to your total score.")
                            .padding([.horizontal])
                        
                        
                    }
                    .font(.title3)
                    
                    Text("Good Luck!")
                        .font(.title)
                    
                }
                .foregroundColor(.black)
                
                Button("Done") {
                    dismiss()
                }
                
                .doneButton() // see constants file
 
                
            }
        }
    }
}

#Preview {
    Instructions()
}
