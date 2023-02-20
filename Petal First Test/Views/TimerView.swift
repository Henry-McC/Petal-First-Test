//
//  TimerView.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 1/7/23.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var dm: WordleDataModel
  //  @State var countDownTimer: Int = 5
    
    var body: some View {
        VStack {
            Text("\(dm.countDownTimer)")
                .onReceive(dm.timer) { _ in
                    if dm.countDownTimer == 0 && dm.timerRunning {
                        dm.outOfTime()
                        dm.multiplierRunning = false
                        dm.timerRunning = false
                    } else if dm.countDownTimer > 0 && dm.timerRunning {
                        dm.countDownTimer -= 1
                    } else {
                        dm.timerRunning = false
                    }
                }
                .opacity(dm.shouldHide ? 1 : 0)
         //       .frame(height: dm.gameOver ? nil : 0)
        }
        .font(.system(size: 30))
        .padding()
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(WordleDataModel())
    }
}
