//
//  ShuffleView.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 1/21/23.
//

import SwiftUI

fileprivate struct DisplayLetter {
    var letter: Character
    var color: Color
}


extension WordleDataModel {
    fileprivate func displayLetters() -> [DisplayLetter] {
        var typeCounts: [Character: Int] = typedLetters.reduce(into: [:]) {
            $0[$1, default: 0] += 1
        }
        
        var answer: [DisplayLetter] = []
        for c in shuffledWord {
            let count = typeCounts[c] ?? 0
            typeCounts[c] = max(0, count - 1)
            answer.append(.init(
                letter: c,
                color: count > 0 ? .yellow : .black
            ))
        }
        return answer
    }
}



struct ShuffleView: View {
    @EnvironmentObject var dm: WordleDataModel
        
    var body: some View {
        HStack(spacing: 15) {
            let dLetters = dm.displayLetters()
            ForEach(dLetters.indices, id: \.self) { i in
                let dLetter = dLetters[i]
                Text(String(dLetter.letter))
                    .font(.system(size: 40))
                    .foregroundColor(dLetter.color)
            }
        }
    }
}






struct ShuffleView_Previews: PreviewProvider {
    static var previews: some View {
        ShuffleView()
            .environmentObject(WordleDataModel())
    }
}

