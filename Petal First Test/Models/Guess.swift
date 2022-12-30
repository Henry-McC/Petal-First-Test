//
//  Guess.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 11/12/22.
//

import SwiftUI

struct Guess {
    let index: Int
    var word = "        " // 8 Spaces
    var bgColors = [Color](repeating: .wrong, count: 6)
    var cardsFlipped = [Bool](repeating: false, count: 6)
    var guessLetters: [String] {
        word.map { String($0) }
    }
    var length = 5
}
