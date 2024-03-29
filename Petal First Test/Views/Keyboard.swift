//
//  Keyboard.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 11/12/22.
//

import SwiftUI


struct Keyboard: View {
    @EnvironmentObject var dm: WordleDataModel
    var topRowArray = "QWERTYUIOP".map{ String($0) }
    var secondRowArray = "ASDFGHJKL".map{ String($0) }
    var thirdRowArray = "ZXCVBNM".map{ String($0) }
    var body: some View {
        VStack {
            HStack(spacing: 2) {
                ForEach(topRowArray, id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
                .disabled(dm.disabledKeys)
                .opacity(dm.disabledKeys ? 0.6 : 1)
            }
            HStack(spacing: 2) {
                ForEach(secondRowArray, id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
                .disabled(dm.disabledKeys)
                .opacity(dm.disabledKeys ? 0.6 : 1)
            }
            HStack(spacing: 2) {
                Button {
                    dm.enterWord()
                } label: {
                    Text("Enter")
                }
                .font(.system(size: 20))
                .frame(width: 60, height: 50)
                .foregroundColor(.white)
                .background(.purple)
                .border(Color("keyPurple"), width: 2)
                .cornerRadius(4)
                .disabled(dm.currentWord.count < 4 || !dm.inPlay)
                .opacity((dm.currentWord.count < 4 || !dm.inPlay) ? 0.6 : 1)
                ForEach(thirdRowArray, id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
                .disabled(dm.disabledKeys)
                .opacity(dm.disabledKeys ? 0.6 : 1)
                Button {
                    dm.removeLetterFromCurrentWord()
                    dm.removeLetterFromTypedLetters()
                } label: {
                    Image(systemName: "delete.backward.fill")
                        .font(.system(size: 20, weight: .heavy))
                        .frame(width: 40, height: 50)
                        .foregroundColor(.white)
                        .background(.purple)
                        .border(Color("keyPurple"), width: 2)
                        .cornerRadius(5)
                    }
                .disabled(!dm.inPlay || dm.currentWord.count == 0)
                .opacity((!dm.inPlay || dm.currentWord.count == 0) ? 0.6 : 1)
                }
            HStack(spacing: 2) {
                Button {
                    dm.nextRound()
                } label: {
                    Text("Next Round")
                }
                .font(.system(size: 20))
                .frame(width: 150, height: 50)
                .foregroundColor(.black)
                .background(.white)
                .disabled(!dm.roundOver || dm.gameOver)
                .opacity((!dm.roundOver || dm.gameOver) ? 0.6 : 1)
                .border(Color.black, width: 2)
                .cornerRadius(5)
                }
            }
        }
    }


struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard()
            .environmentObject(WordleDataModel())
    }
}
