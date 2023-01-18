//
//  HelpView.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 1/9/23.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            VStack() {
                Text("PETAL")
                    .font(.system(size: 40))
                    .frame(alignment: .center)
                Spacer()
                Text(
"""
Write the longest word you can think of within the time limit. The longer the word, the higher the score!
""")
                .font(.system(size: 25))
                .multilineTextAlignment(.center)
Divider()
                Text(
"""
The faster you are, the more time you will have for the next round!
""")
                .font(.system(size: 25))
                .multilineTextAlignment(.center)
Divider()
                Text(
"""
Careful, the words will get longer so make sure you save up your time!
""")
                .font(.system(size: 25))
                .multilineTextAlignment(.center)
Divider()
                Text(
"""
After 5 rounds you'll receive a bonus depending on how quickly you finished the game so make sure you balance your guess length and speed!
""")
                .font(.system(size: 25))
                .multilineTextAlignment(.center)
            Spacer()
            }
            .frame(width: min(Global.screenWidth - 40, 350))
            .navigationTitle("HOW TO PLAY")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("**X**")
                    }
                }
            }
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
