//
//  GamePlay.swift
//  HP Trivia
//
//  Created by Mark Santoro on 11/3/24.
//

import SwiftUI


struct GamePlay: View {
    @State private var animateViewsIn = false
    
    var body: some View {
        GeometryReader {geo in
            ZStack{
                Image("hogwarts")
                    .resizable()
                    .frame(width: geo.size.width*3, height: geo.size.height*1.05)
                    .overlay(Rectangle().foregroundColor(.black.opacity(0.8)))
                
                VStack {
                    // MARK: Controls
                    HStack{
                        Button("End Game") {
                            // end the game
                          
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red.opacity(0.5))
                        
                        Spacer()
                        
                        Text("Score: 33")
                    }
                    .padding()
                    .padding(.vertical, 30)
                    
                    VStack{
                        // MARK: Question
                        if animateViewsIn {
                            Text("Who is Harry Potter?")
                                .font(.custom(Constants.hpFont, size: 50))
                                .multilineTextAlignment(.center)
                                .padding()
                                .transition(.scale)
                            
                        }
                    }
                    .animation(.easeInOut(duration: 2),value:animateViewsIn)
                    
                    Spacer()
                    
                    HStack{
                        // MARK: Hints
                        VStack{
                            if animateViewsIn {
                                Image(systemName: "questionmark.app.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100)
                                    .foregroundColor(.cyan)
                                    .rotationEffect(.degrees(-15))
                                    .padding()
                                    .padding(.leading, 20)
                                    .transition(.offset(x: -geo.size.width/2))
                            }
                        }
                        .animation(.easeOut(duration: 1.5).delay(2),value:animateViewsIn)
                        
                        Spacer()
                        
                        VStack{
                            if animateViewsIn {
                                Image(systemName: "book.closed")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50)
                                    .foregroundColor(.black)
                                    .frame(width: 100, height: 100)
                                    .background(.cyan)
                                    .cornerRadius(20)
                                    .rotationEffect(.degrees(15))
                                    .padding()
                                    .padding(.trailing, 20)
                                    .transition(.offset(x: geo.size.width/2))
                                
                            }
                        }
                        .animation(.easeOut(duration: 1.5).delay(2),value:animateViewsIn)
                    }
                    .padding(.bottom)
                    
                    // MARK: Answers
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(1..<5) {i in
                            VStack{
                                if animateViewsIn {
                                    Text(i==3 ? "The boy who lived and got sent to his relatives house where he was traeted badly kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk" : "Answer \(i)")
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.center)
                                        .padding(10)
                                        .frame(width: geo.size.width/2.15, height: 80)
                                        .background(.green.opacity(0.5))
                                        .cornerRadius(25)
                                        .transition(.scale)
                                }
                            }
                            .animation(.easeOut(duration: 1).delay(1.5),value:animateViewsIn)
                            
                        }
                    }
                    
                    Spacer()
                    
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .foregroundColor(.white)
                
                // MARK: Celebration
                VStack{
                    Spacer()
                    
                    Text("5")
                        .font(.largeTitle)
                        .padding(.top, 50)
                    
                    Spacer()
                    
                    Text("Brilliant!")
                        .font(.custom(Constants.hpFont, size: 100))
                    
                    Spacer()
                    
                    Text("Answer 1")
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: geo.size.width/2.15, height: 80)
                        .background(.green.opacity(0.5))
                        .cornerRadius(25)
                        .scaleEffect(2)
                    Group{
                        Spacer()
                        Spacer()
                    }
                    
                    // MARK: Reset level for next question
                    Button("Next Level>"){
                        // add reset level for next question here
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue.opacity(0.5))
                    .font(.largeTitle)
                    
                    Group{
                        Spacer()
                        Spacer()
                    }
                    
                }
                .foregroundColor(.white)
                
                
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
            
            
        }
        .ignoresSafeArea()
        .onAppear(){
         //   animateViewsIn = true
        }
    }
}

#Preview {
    GamePlay()
}
