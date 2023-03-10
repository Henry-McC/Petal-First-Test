//
//  LetterButtonView.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 11/12/22.
//

import SwiftUI

struct LetterButtonView: View {
    @EnvironmentObject var dm: WordleDataModel
    var letter: String
    var body: some View {
        Button {
            dm.addToCurrentWord(letter)
            dm.addToTypedLetters(Character(letter))
        } label: {
            Text(letter)
                .font(.system(size: 20))
                .frame(width: 35,height: 50)
                .background(.white)
                .foregroundColor(.black)
                .border(Color.black, width: 2)
                .cornerRadius(4)
        }
        .buttonStyle(.plain)
    }

}

struct LetterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LetterButtonView(letter: "L")
            .environmentObject(WordleDataModel())
    }
}
