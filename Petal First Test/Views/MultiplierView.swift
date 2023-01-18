//
//  MultiplierView.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 1/9/23.
//

import SwiftUI

struct MultiplierView: View {
    @EnvironmentObject var dm: WordleDataModel
    var body: some View {
        Text("\(dm.multiplier)")
            .onReceive(dm.multiplierTimer) { _ in
                if dm.multiplier > 0 && dm.multiplierRunning {
                    dm.multiplier -= 0.001
                } else {
                    dm.multiplierRunning = false
                }
            }
            .font(.system(size: 3))
    }
}

struct MultiplierView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplierView()
            .environmentObject(WordleDataModel())
    }
}
