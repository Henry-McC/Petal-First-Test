//
//  Global.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 11/12/22.
//

import UIKit

enum Global {
    static var screenWidth: CGFloat {
        UIScreen.main.bounds.size.width
    }
    static var screenHeight: CGFloat {
        UIScreen.main.bounds.size.height
    }
    static var minDimension: CGFloat {
        min(screenWidth,screenHeight)
    }
    static var boardWidth: CGFloat {
        switch minDimension {
        case 0...320:
            return screenWidth - 55
        case 321...420:
            return screenWidth - 50
        case 431...1000:
            return 350
        default:
            return 500
        }
    }
    
    static var keyboardScale: CGFloat {
        switch minDimension {
        case 0...430:
            return screenWidth / 390
        case 431...1000:
            return CGFloat(1.2)
        default:
            return CGFloat(1.6)
        }
    }
    
    static let commonWords = ["THINKS", "ROWING", "FLIGHT", "WRITER", "BITTER"]
    static let commonWords2 = ["PROPOSE", "ATHLETE"]
    static let commonWords3 = ["STANDARD", "DOCUMENT"]
}
