//
//  ContentView.swift
//  HP Trivia
//
//  Created by Mark Santoro on 10/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader {geo in
            ZStack{
                Image("hogwarts")
                    .resizable()
                    .frame(width: geo.size.width * 3, height: geo.size.height)
                    .padding(.top, 3)
                
                VStack{
                    VStack{
                        Image(systemName: "bolt.fill")
                            .font(.largeTitle)
                            .imageScale(.large)
                        
                        Text("HP")
                            .font(.custom(Constants.hpFont, size: 70))
                            .padding(.bottom, -50)
                        
                        Text("Trivia")
                            .font(.custom(Constants.hpFont, size: 60))
                    }
                    
                    
                    
                }
                
                
                
                
                
                
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
            
            
        }
        .ignoresSafeArea()
    }
    
}

#Preview {
    ContentView()
}
