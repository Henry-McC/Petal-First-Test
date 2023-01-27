//
//  HelpView.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 1/9/23.
//

import SwiftUI

struct Page: View {
    @Environment(\.dismiss) var dismiss
    let title: String
    let image: String
    let bodyOne: String
    let bodyTwo: String
    let color: Color
    
    
    var body: some View {
       
        VStack {
            Text(title)
                .bold()
                .font(.title)
                .foregroundColor(.white)
                .padding(.bottom, 32)
            Text(bodyOne)
                .foregroundColor(.white)
                .padding()
            Image(image)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .padding()
                
            Text(bodyTwo)
                .foregroundColor(.white)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(color)
        .cornerRadius(16)
        .padding()
    }
}


struct HelpView: View {
    var body: some View {
        TabView {
            Page(
                title: "How to Play",
                image: "HelpOne",
                bodyOne: "Petal is a 5 round game where players try to find the longest word possible before time runs out.",
                bodyTwo: "There will always be at least one word that uses all the letters shown, but you can submit any word that's at least 4 letters long!",
                color: Color(.purple)
            )
            Page(
                title: "How to Play",
                image: "HelpTwo",
                bodyOne: "When round 1 starts, you have 10 seconds to submit a word. Each following round, 10 more seconds are added to your time.",
                bodyTwo: "Pay attention to the time you have left! The words will get longer on rounds 3 and 5 so make sure you save up enough time to get the best words!",
                color: Color(.systemPink)
            )
            Page(
                title: "How to Play",
                image: "HelpThree",
                bodyOne: "Every round, you get 100 points multiplied by the length of your word so a full word on round 8 gives you 800 points.",
                bodyTwo: "Number of letters isn't all though. your final score is multiplied depending on how quickly you finished so balance word length with speed. Good Luck!",
                color: Color(.purple)
            )
        }
        .tabViewStyle(PageTabViewStyle())
    }
}


struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
