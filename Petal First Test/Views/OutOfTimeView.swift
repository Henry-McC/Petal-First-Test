//
//  OutOfTimeView.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 2/12/23.
//

import SwiftUI

struct OutOfTimeView: View {
    @EnvironmentObject var dm: WordleDataModel
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Spacer()
                Button {
                    withAnimation {
                        dm.showOutOfTime.toggle()
                        dm.shouldHide = false
                        dm.showRound = false
                    }
                } label: {
                    Text("Close")
                }
                .offset(x: 10, y: 20)
            }
            Text("So Close!")
                .font(.title2)
                .fontWeight(.bold)
            VStack(spacing: 10) {
                HStack {
                    Text("Score:")
                    Text("\(dm.userScore)")
                        .font(.title)
                }
                HStack {
                    Text("High Score:")
                    Text("\(dm.highScore)")
                        .font(.title)
                }
                Spacer()
                Text("You Lost on Round \(dm.round)")
               
                    .fontWeight(.bold)
                Text("The Word Was:")
                Text("\(dm.selectedWord)")
                    .font(.title)
                Spacer()
                Text("You'll get it next time!")
            }
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
struct OutOfTimeView_Previews: PreviewProvider {
    static var previews: some View {
        OutOfTimeView()
            .environmentObject(WordleDataModel())
    }
}
