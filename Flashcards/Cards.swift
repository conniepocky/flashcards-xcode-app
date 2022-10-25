//
//  Cards.swift
//  woop woop
//
//  Created by Connie Waffles on 19/08/2022.
//

import Foundation

class GlobalCards: ObservableObject {
    @Published var answers: [String] = []
    @Published var questions: [String] = []
}
