//
//  EditFlashcardsView.swift
//  woop woop
//
//  Created by Connie Waffles on 03/08/2022.
//

import SwiftUI

struct EditFlashcardsView: View {
    
    @State public var questions = UserDefaults.standard.stringArray(forKey: "questions")
    @State public var answers = UserDefaults.standard.stringArray(forKey: "answers")
    
    @EnvironmentObject var cards: GlobalCards
    
    var body: some View {
        if questions?.isEmpty == false || answers?.isEmpty == false {
            VStack {
                List {
                    ForEach(UserDefaults.standard.stringArray(forKey: "questions")!, id: \.self) { question in
                        Group {
                            Text("\((questions?.firstIndex(of: question) ?? 0) + 1) : \(question) ")
                                .foregroundColor(.blue)
                            //Divider()
                            Text(answers![(questions?.firstIndex(of: question) ?? 0)])
                                .foregroundColor(.red)
                        }
                    }.onDelete { offsets in
                        answers!.remove(atOffsets: offsets)
                        questions!.remove(atOffsets: offsets)
                        
                        cards.answers = answers!
                        cards.questions = questions!
                        
                        UserDefaults.standard.set(questions, forKey: "questions")
                        UserDefaults.standard.set(answers, forKey: "answers")
                    }
                }.navigationBarTitle("Flashcards")
                
            }
        } else {
            Text("You have no flashcards ☹️")
                .font(.title)
        }
    }
}

struct EditFlashcardsView_Previews: PreviewProvider {
    static var previews: some View {
        EditFlashcardsView()
    }
}
