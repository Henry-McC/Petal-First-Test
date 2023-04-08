//
//  Petal_First_TestApp.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 11/12/22.
//

import SwiftUI
import GoogleMobileAds
import UserNotifications

@main
struct Petal_First_TestApp: App {
    let adsVM = AdsViewModel.shared
    init() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    @StateObject var dm = WordleDataModel()
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
                .environmentObject(adsVM)
                .onAppear {
                    NotificationManager.instance.requestAuthorization()
                    NotificationManager.instance.scheduleDailyNotification(hour: 10, minute: 14)
                }
        }
        
    }
}

