//
//  GuessView.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 11/12/22.
//

import SwiftUI

struct GuessView: View {
@EnvironmentObject var dm: WordleDataModel

    @Binding var guess: Guess
    var body: some View {
        HStack(spacing: 3) {
            ForEach(0...dm.boardLength, id: \.self) { index in
                Text(guess.guessLetters[index])
                    .foregroundColor(.primary)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .center)
                   // .background(Color.systemBackground)
                    .font(.system(size: 35, weight: .heavy))
                    //.border(Color(.secondaryLabel))
                    .overlay(
                        Rectangle()
                            .frame(height: 3)
                            .foregroundColor(.pink),
                        alignment: .bottom
                )
                    
            }
        }
    }
}

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        GuessView(guess: .constant(Guess(index: 0)))
            .environmentObject(WordleDataModel())
    }
}
