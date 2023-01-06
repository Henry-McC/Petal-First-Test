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
        Text(dm.roundText())
        Text("Score: \(dm.userScore) High Score: \(dm.highScore)")
    }
}

struct RoundView_Previews: PreviewProvider {
    static var previews: some View {
        RoundView()
            .environmentObject(WordleDataModel())
    }
}
