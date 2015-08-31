//
//  RPSLS.swift
//  RPSLS
//
//  Created by gustavo.freitas2 on 8/31/15.
//  Copyright (c) 2015 himynameisgustavo. All rights reserved.
//

import Foundation


enum RPSLS{
    
    case Rock , Paper, Scissors, Lizard, Spock
    
    init() {
        switch arc4random() % 5 {
            
        case 0:
            self = .Rock
        case 1:
            self = .Paper
        case 2:
            self = .Scissors
        case 3 :
            self = .Lizard
        case 4 :
            self = .Spock
        default:
            self = .Rock
        }
    }
    
    func defeats(opponent : RPSLS) -> Bool {
        switch (self, opponent) {
        case (.Paper, .Rock),
        (.Rock, .Lizard),
        (.Lizard, .Spock),
        (.Spock, .Scissors),
        (.Scissors, .Paper),
        (.Paper, .Spock),
        (.Spock, .Rock),
        (.Rock, .Scissors),
        (.Scissors, .Lizard),
        (.Lizard, .Paper):
            return true
        default :
            return false
        }
    }
    
    var description: String {
        
        switch(self) {
        case .Rock:
            return "Rock"
        case .Paper:
            return "Paper"
        case .Scissors:
            return "Scissors"
        case .Lizard:
            return "Lizard"
        case .Spock:
            return "Spock"
        }
    }
    
    
    func action(#opponent: RPSLS) -> String {
        
        switch(self, opponent) {
        case (.Scissors, .Paper): return "cut"
        case (.Paper, .Rock): return "couvers"
        case (.Rock, .Lizard): return "crushes"
        case (.Lizard, .Spock): return "poison"
        case (.Spock, .Scissors): return "smashes"
        case (.Scissors, .Lizard): return "decapitates"
        case (.Lizard, .Paper): return "eat"
        case (.Paper, .Spock): return "disproofs"
        case (.Spock, .Rock): return "vaporizes"
        case (.Rock, .Scissors): return "chushes"
        default: return " "
        }
    }

}