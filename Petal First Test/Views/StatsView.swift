//
//  StatsView.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 1/25/23.
//

import SwiftUI

struct StatsView: View {
    @EnvironmentObject var dm: WordleDataModel
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Spacer()
                Button {
                    withAnimation {
                        dm.showStats.toggle()
                    }
                } label: {
                    Text("Close")
                }
                .offset(x: 10, y: 20)
            }
            Text("NICE ONE!")
                .font(.headline)
                .fontWeight(.bold)
            VStack(spacing: 10) {
                HStack {
                    Text("You Scored:")
                    Text("\(dm.userScore)")
                        .font(.title)
                }
                HStack {
                    Text("High Score:")
                    Text("\(dm.highScore)")
                        .font(.title)
                }
                Spacer()
                Text("Your Words:")
               
                    .fontWeight(.bold)
                Text("House, Rowing")
                Text("Archive, Rise")
                Text("Creation")
                Spacer()
                Text("Total Time:")
                    .fontWeight(.bold)
                Text("\(dm.countDownTimer)")
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

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
            .environmentObject(WordleDataModel())
    }
}
