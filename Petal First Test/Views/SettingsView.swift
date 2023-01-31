//
//  SettingsView.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 1/21/23.
//

import SwiftUI


struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            VStack() {
                Text("Settings")
                    .font(.system(size: 40))
                    .frame(alignment: .center)
                Spacer()
                Spacer()
            }
            .frame(width: min(Global.screenWidth - 40, 350))
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("**Close**")
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
