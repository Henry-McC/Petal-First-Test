//
//  RoundView.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 12/29/22.
//

import SwiftUI

struct RoundView: View {
    @EnvironmentObject var dm: WordleDataModel

    var body: some View {
        if dm.showRound == true {
            Text(dm.roundText())
                .font(.title2)
            Text("Score: \(dm.userScore)")
                .font(.title2)
        } else {
            Text("High Score: \(dm.highScore)")
                .font(.title)
        }
        
    }
}

struct RoundView_Previews: PreviewProvider {
    static var previews: some View {
        RoundView()
            .environmentObject(WordleDataModel())
    }
}
