//
//  GameView.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 11/12/22.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var dm: WordleDataModel
    @State private var showHelp = false
    var body: some View {
            NavigationView {
                ZStack {
                    BackgroundView()
                    VStack {
                        VStack {
                            RoundView()
                            TimerView()
                            MultiplierView()
                            //      .hidden()
                                .opacity(0)
                            //             Spacer()
                        }
                        .frame(alignment: .bottom)
                        Text(dm.testWord)
                            .font(.largeTitle)
                        Button {
                            dm.startGame()
                        } label: {
                            Text("Start!")
                        }
                        .padding(12)
                        .padding([.trailing, .leading], 20)
                        .foregroundColor(.white)
                        .background(.purple)
                        .cornerRadius(5)
                        .opacity(dm.shouldHide ? 0 : 1)
                        // .frame(maxHeight:  UIScreen.main.bounds.size.height - 620)
                        //  .frame(height: dm.shouldHide ? nil : 0)
                        VStack(spacing: 3) {
                            GuessView(guess: $dm.guesses[0])
                                .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[0])))
                        }
                        .padding([.top], 30)
                        .frame(width: Global.boardWidth, height: 3.8 * Global.boardWidth / 8)
                        //         Spacer()
                        Keyboard()
                            .scaleEffect(Global.keyboardScale)
                            .padding([.bottom], 20)
                        //    .frame(alignment: .bottom)
                        // Spacer()
                    }
                    //   .padding([.bottom], 100)
                    .frame(maxHeight: 1100, alignment: .bottom)
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
                                showHelp.toggle()
                            } label: {
                                Image(systemName: "questionmark.circle")
                            }
                            .foregroundColor(.black)
                        }
                        ToolbarItem(placement: .principal) {
                            Text("Petal")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            /*      HStack {
                             Button {
                             
                             } label: {
                             Image(systemName: "chart.bar")
                             }
                             Button {
                             
                             } label: {
                             Image(systemName: "gearshape.fill")
                             }
                             } */
                        }
 
                    }

                }
                
            }
            .frame(height: UIScreen.main.bounds.size.height)
            .navigationViewStyle(.stack)
            .sheet(isPresented: $showHelp) {
                HelpView()
            }
        }
    }



struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(WordleDataModel())
    }
}
