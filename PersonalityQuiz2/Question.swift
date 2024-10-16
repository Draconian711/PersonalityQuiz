//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Kevin Bjornberg on 10/8/24.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: Richness
}

enum Richness: String {
    case broke = "Broke 🤦🏿‍♂️", someMoney = "Poor👨🏾‍💼", comfortable = "Comfortable 👨🏼‍⚖️", loaded = "Rich 🤑"
    
    var definition: String {
        switch self {
        case .broke:
            return "With your current knowlege of basic side hustles, it looks like you are not going to make very much money."
        case .someMoney:
            return "With your current knowlege of basic side hustles, it looks like you will be able to make a little extra cash throughout the year."
        case .comfortable:
            return "With your current knowlege of basic side hustles, it looks like you might be able to support yourself without a basic 9 - 5."
        case .loaded:
            return "With your current knowlege of basic side hustles, it looks like you might be able to live a good life and experience true financial freedom."
        }
    }
}
