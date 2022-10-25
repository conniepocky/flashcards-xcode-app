//
//  ContentView.swift
//  Flashcards
//
//  Created by Connie Waffles on 25/09/2022.
//

import SwiftUI

struct ContentView: View {

    @StateObject var cards = GlobalCards()
    
    var body: some View {
        NavigationView {
            
            VStack {
                Text("Flashcards")
                    .font(.title)
                    .foregroundColor(.mint)
                    .fontWeight(.bold)
                
                
                VStack {
                    HStack {
                        
                        NavigationLink(destination: CardMakerView().environmentObject(cards)) {
                            Text("Make Flashcards")
                        }
                        
                        Divider()
                        
                        
                        NavigationLink(destination: EditFlashcardsView().environmentObject(cards)) {
                            Text("Edit Flashcards")
                        }
                    }
                    
                    Divider()
                    
                    NavigationLink(destination: FlashcardTesterView().environmentObject(cards)) {
                        Text("Test Flashcards")
                    }
                }
                .foregroundColor(.mint)
                .padding()
                .frame(height: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.mint, lineWidth: 5)
                )
            }
            .padding()
        }
    }
}
