//
//  PauseView.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 3/24/23.
//

import SwiftUI

struct PauseView: View {
    @EnvironmentObject var dm: WordleDataModel
    var body: some View {
        VStack {
            Text("Petal")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)
            Spacer()
            Button {
                dm.showPause.toggle()
                dm.resumeGame()
                dm.inPlay = true
            } label: {
                Text("Continue")
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
            Button {
                dm.gameOver = true
                dm.inPlay = false
                dm.shouldHide = false
                dm.showRound = false
                dm.showPause.toggle()
            } label: {
                Text("Quit")
            }
            .padding(.horizontal, 39)
            .padding(.vertical, 10)
            .foregroundColor(.white)
            .background(.red)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.0), radius: 0)
            Spacer()
            Link("Check Out Our Social Media!", destination: URL(string: "https://linktr.ee/petalapp")!)
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                .background(.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
            Spacer()
        }
        .padding(.horizontal, 40)
        .frame(width: 320, height: 370)
        .background(RoundedRectangle(cornerRadius: 15)
            .fill(.white))
        .padding()
        .shadow(color: .black.opacity(0.3), radius: 10)

    }
}

struct PauseView_Previews: PreviewProvider {
    static var previews: some View {
        PauseView()
    }
}
