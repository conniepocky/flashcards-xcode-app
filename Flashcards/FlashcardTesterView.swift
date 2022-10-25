//
//  FlashcardTesterView.swift
//  woop woop
//
//  Created by Connie Waffles on 01/08/2022.
//

import SwiftUI

struct FlashcardTesterView: View {
    
    @EnvironmentObject var cards: GlobalCards
    
    @State public var savedAnswers = UserDefaults.standard.stringArray(forKey: "answers")
    
    @State public var savedQuestions = UserDefaults.standard.stringArray(forKey: "questions")
    
    @State public var isQuestion = true
    
    @State public var index = 0
    
    var body: some View {
        
        let _ = print(cards.questions)
        
        if cards.questions.isEmpty == false || cards.answers.isEmpty == false {
            if savedAnswers?.isEmpty == false || savedQuestions?.isEmpty == false {
                Text("You have no flashcards ☹️")
                    .font(.title)
            } else {
                VStack {
                    
                    Text("\(index+1)/\(savedQuestions!.count)")
                        .font(.title)
                    
                    VStack {
                        Text(isQuestion == true ? savedQuestions![index] : savedAnswers![index])
                            .font(.title)
                    }
                    .frame(width: 350, height: 300)
                    .background(isQuestion == true ? .blue : .red)
                    .cornerRadius(40)
                    .onTapGesture {
                        isQuestion.toggle()
                    }
                    
                    
                    if savedAnswers != nil || savedQuestions != nil {
                        Button(action: {
                            
                            isQuestion = true
                            
                            if index+1 >= savedQuestions!.count || index+1 > savedAnswers!.count {
                                index = 0
                            } else {
                                index += 1
                            }
                        }) {
                            Text("Next Card")
                                .font(.title)
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
        } else {
            VStack {
                
                Text("\(index+1)/\(savedQuestions!.count)")
                    .font(.title)
                
                VStack {
                    Text(isQuestion == true ? cards.questions[index] : cards.answers[index])
                        .font(.title)
                }
                .frame(width: 350, height: 300)
                .background(isQuestion == true ? .blue : .red)
                .cornerRadius(40)
                .onTapGesture {
                    isQuestion.toggle()
                }
                
                
                if savedAnswers != nil || savedQuestions != nil {
                    Button(action: {
                        
                        isQuestion = true
                        
                        if index+1 >= savedQuestions!.count || index+1 > savedAnswers!.count {
                            index = 0
                        } else {
                            index += 1
                        }
                    }) {
                        Text("Next Card")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}
