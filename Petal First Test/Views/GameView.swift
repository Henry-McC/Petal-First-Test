//
//  GameView.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 11/12/22.
//

import SwiftUI
import GoogleMobileAds

struct GameView: View {
    @EnvironmentObject var dm: WordleDataModel
    @EnvironmentObject var adsVM: AdsViewModel
    @State private var showHelp = false
    @State private var showSettings = false
    var body: some View {
        
        ZStack {
            
            NavigationView {
                ZStack {
                    BackgroundView()
                    VStack {
                        VStack {
                            RoundView()
                            TimerView()
                                .opacity(dm.shouldHide ? 1 : 0)
                            MultiplierView()
                            //      .hidden()
                                .opacity(0)
                            //             Spacer()
                        }
                        .frame(alignment: .bottom)
                        ShuffleView()
                            .opacity(dm.shouldHide ? 1 : 0)
                        Button {
                            //adsVM.showInterstitial.toggle()
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
                            HStack {
                                /*  Button {
                                 
                                 } label: {
                                 Image(systemName: "chart.bar")
                                 }*/
                               /* Button {
                                    showSettings.toggle()
                                } label: {
                                    Image(systemName: "gearshape.fill")
                                }
                                .foregroundColor(.black) */
                            }
                        }
                        
                    }
                }
                }
                if dm.showStats {
                    StatsView()
                }
            }
            .frame(height: UIScreen.main.bounds.size.height)
            .navigationViewStyle(.stack)
            .sheet(isPresented: $showHelp) {
                HelpView()
            }
           /* .sheet(isPresented: $showSettings) {
                SettingsView()
            } */
        }
    }



struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(WordleDataModel())
            .environmentObject(AdsViewModel())
    }
}
