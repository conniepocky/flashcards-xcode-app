//
//  CardMakerView.swift
//  woop woop
//
//  Created by Connie Waffles on 01/08/2022.
//

import SwiftUI

struct CardMakerView: View {
    
    @State private var showingAlert = false
    
    @State public var answers: [String] = []
    @State public var questions: [String] = []
    
    @State public var savedAnswers = UserDefaults.standard.stringArray(forKey: "answers")   
    @State public var savedQuestions = UserDefaults.standard.stringArray(forKey: "questions")
    
    @State public var currentAnswer = ""
    @State public var currentQuestion = ""
    
    @State public var question = true
    
    @EnvironmentObject var cards: GlobalCards
    
    var body: some View {
        VStack {
            Text("Flashcard Maker")
                .font(.title2)
                .padding()
            
            
            HStack {
                Button(action: {
                    question = true
                }) {
                    HStack {
                        Text("Question Side")
                            .foregroundColor(question == true ? .blue : .primary)
                            .fontWeight(.semibold)
                    }
                }
                
                Button(action: {
                    question = false
                }) {
                    HStack {
                        Text("Answer Side")
                            .foregroundColor(question == true ? .primary : .red)
                            .fontWeight(.semibold)
                    }
                }
            }
            
            VStack {
                TextField("Enter Text Here", text: question == true ? $currentQuestion : $currentAnswer)
                    .padding()
            }
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(question == true ? .blue : .red, lineWidth: 5)
            )
            .padding()
            
            Button(action: {
                if currentQuestion == "" {
                    showingAlert = true
                    print("empty")
                } else if currentAnswer == "" {
                    showingAlert = true
                    print("empty")
                } else {
                    
                    //questions

                    print("saved questions is \(savedQuestions)")
                    print("current questions is \(questions)")

                    questions = savedQuestions ?? questions
                    questions.append(currentQuestion)
                    
                    cards.questions = questions

                    UserDefaults.standard.set(questions, forKey: "questions")

                    print("saved questions after \(savedQuestions)")
                    print("current questions after \(questions)")

                    currentQuestion = ""
                    
                    //answers
                    
                    print("saved answers is \(savedAnswers)")
                    print("current answers is \(answers)")

                    answers = savedAnswers ?? answers
                    answers.append(currentAnswer)
                    
                    cards.answers = answers

                    UserDefaults.standard.set(answers, forKey: "answers")

                    print("saved answers after \(savedAnswers)")
                    print("current answers after \(answers)")
                    print("global answers after \(cards.answers)")

                    currentAnswer = ""
                }
                
            }) {
                HStack {
                    Text("Add Card")
                        .font(.title2)
                }
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text("Missing Value"), message: Text(currentQuestion == "" && currentAnswer == "" ? "Please enter in a question and an answer." : currentQuestion == "" ? "Please enter in a question." : "Please enter in an answer."), dismissButton: .default(Text("Ok!")))
                
            }
        }
    }
}

//struct CardMakerView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardMakerView()
//    }
//}
