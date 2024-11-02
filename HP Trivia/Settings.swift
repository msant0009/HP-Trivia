//
//  Settings.swift
//  HP Trivia
//
//  Created by Mark Santoro on 11/1/24.
//

import SwiftUI

struct Settings: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack{
            InfoBackgroundImage()
            
            VStack{
             Text("Which books would you like to see questions from?")
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ZStack(alignment: .bottomTrailing){
                            Image("hp1")
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 7)
                            
                            Image(systemName:
                                    "checkmark.circle.fill")
                            .font(.largeTitle)
                            .imageScale(.large)
                            .foregroundColor(.green)
                            .shadow(radius: 1)
                            .padding(3)
                            
                        }
                        
                        ZStack(alignment: .bottomTrailing){
                            Image("hp2")
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 7)
                                .overlay(Rectangle().opacity(0.33))
                            
                            Image(systemName: "circle")
                                .font(.largeTitle)
                                .imageScale(.large)
                                .foregroundColor(.green.opacity(0.5))
                                .shadow(radius: 1)
                                .padding(3)
                        }
                        
                        ZStack{
                            Image("hp3")
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 7)
                                .overlay(Rectangle().opacity(0.75))
                            
                            Image(systemName: "lock.fill")
                                .font(.largeTitle)
                                .imageScale(.large)
                                .shadow(color:
                                        .white.opacity(0.75),
                                        radius: 3)
                                
                        }
                    }
                        .padding()
                    }
                
                
                Button("Done") {
                    dismiss()
                }
                
                
                .doneButton() // see constants file
            }
        }
    }
}

#Preview {
    Settings()
}
