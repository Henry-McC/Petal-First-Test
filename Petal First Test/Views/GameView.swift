//
//  GameView.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 11/12/22.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var dm: WordleDataModel
    var body: some View {
        NavigationView {
            VStack {
                //Text("Round: \(dm.round)/5")
                RoundView()
                Spacer()
                Text(dm.testWord)
                    .font(.largeTitle)
                Button {
                    dm.startGame()
                } label: {
                    Text("New Game")
                }
                .padding(10)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(5)
                .opacity(dm.shouldHide ? 0 : 1)
             //  .frame(height: dm.shouldHide ? nil : 0)
                VStack(spacing: 3) {
                    GuessView(guess: $dm.guesses[0])
                        .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[0])))
                }
                .frame(width: Global.boardWidth, height: 6 * Global.boardWidth / 8)
               // Spacer()
                Keyboard()
                    .scaleEffect(Global.keyboardScale)
                    .padding(.top)
               // Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .overlay(alignment: .top) {
                if let toastText = dm.toastText {
                    ToastView(toastText: toastText)
                        .offset(y: 20)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "questionmark.circle")
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Petal")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "chart.bar")
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape.fill")
                        }
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(WordleDataModel())
    }
}
