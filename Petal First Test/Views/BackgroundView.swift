//
//  BackgroundView.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 1/14/23.
//

import SwiftUI

struct BackgroundView: View {
    @EnvironmentObject var dm: WordleDataModel
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Circle()
                            .fill(Color.misplaced)
                            .frame(width: geometry.size.width * 0.45, height: geometry.size.width * 0.45)
                            .offset(x: -geometry.size.width * 0.1, y: -geometry.size.height * 0.05)
                        Circle()
                            .fill(Color.misplaced)
                            .frame(width: geometry.size.width * 0.45, height: geometry.size.width * 0.5)
                            .offset(x: geometry.size.width * 0.3, y: geometry.size.height * 0.2)
                    }
                    HStack(spacing: 0) {
                        Circle()
                            .fill(Color.misplaced)
                            .frame(width: geometry.size.width * 0.45, height: geometry.size.width * 0.45)
                            .offset(x: geometry.size.width * 0.02, y: geometry.size.height * 0.3)
                        Circle()
                            .fill(Color.misplaced)
                            .frame(width: geometry.size.width * 0.45, height: geometry.size.width * 0.45)
                            .offset(x: geometry.size.width * 0.2, y: geometry.size.height * 0.5)
                    }
                }
            }
        }

    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
            .environmentObject(WordleDataModel())
    }
}
