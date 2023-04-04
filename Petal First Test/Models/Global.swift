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
        case 321...430:
            return screenWidth - 50
        case 431...1000:
            return 350
        default:
            return 500
        }
    }
    
    static var boardHeight: CGFloat {
        switch minDimension {
        case 0...320:
            return screenWidth - 55
        case 321...430:
            return screenWidth - 50
        case 431...1000:
            return 350
        default:
            return 725
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
    
    
    static let commonWords = ["ALCOVE", "ANSWER", "BEHIND", "BITTER", "BLAZER", "BORING", "BUILDS", "CARBON", "CATCHY", "EXPAND", "EXPECT", "EXPERT", "FALTER", "FLIGHT", "FORMAT", "GILDED", "GROUND", "JUMBLE", "LETTER", "NORMAL", "NUMBER", "OBJECT", "PROPER", "QUARRY", "QUIVER", "ROWING", "SEARCH", "SECOND", "SHOULD", "SPRING", "SPREAD", "STITCH", "STRIKE", "STREET", "SUBMIT", "TIMBER", "THINKS", "WITHIN", "WONDER", "WRITER", "BABBLE", "BADGER", "BAFFLE", "BUTLER", "BUTTON", "BUNKER", "BULLET", "GALLEY", "GALLON", "GUILTY", "GROVEL", "IGNITE", "IDIOTS", "INFECT", "LEGACY", "PUTTER", "PROVEN", "PRINCE", "WELDER", "UNEASY", "VERBAL", "VIKING", "TWENTY", "TYRANT", "TURKEY", "RARELY", "REALTY", "REVIVE", "QUARTZ", "QUORUM"]
    
    
    static let commonWords2 = ["ADVANCE", "ANOTHER", "ARCHIVE", "ATHLETE", "BECAUSE", "COMPANY", "CONCEPT", "COVERED", "DELIVER", "DRIZZLE", "DYNAMIC", "ELEGANT", "EMERALD", "FEELING", "FREIGHT", "FURTHER", "HOLDING", "HEIRESS", "HYDRATE", "LUNATIC", "LYRICAL", "MACHINE", "NATURAL", "NEGLECT", "PARTNER", "PAYMENT", "PLATOON", "PRESENT", "PROTECT", "PROPOSE", "PURSUIT", "REALIST", "SCIENCE", "SERVICE", "STORAGE", "THEATER", "THERAPY", "TEDIOUS", "WATCHES", "WITHOUT", "CABBAGE", "CALIBER", "CASHIER", "CHAPTER", "DEAREST", "DECEIVE", "DECLINE", "ECHELON", "ELITISM", "EMBRACE", "EMPOWER", "FACULTY", "FAINTED", "FIGMENT", "HABITAT", "HIDEOUT", "HIGHWAY", "ICEBERG", "IMPEACH", "ISOLATE", "JEWELRY", "JOYRIDE", "KICKOFF", "KITCHEN", "MACHINE", "MANAGER", "MASSIVE", "PACIFIC", "SALVAGE", "SCHOLAR"]
    
    static let commonWords3 = ["BUSINESS", "BATHROOM", "BIRTHDAY", "BULLDOZE", "CARNIVAL", "CHIPMUNK", "CLOTHING", "COMPLETE", "COMPUTER", "CONSTANT", "CREATION", "DETAILED", "DISCOUNT", "DISGUISE", "DOWNLOAD", "DOCUMENT", "EQUALITY", "EVERYONE", "FLEXIBLE", "FIREWORK", "FREEZING", "GRACIOUS", "MARRIAGE", "MEMORIZE", "MOUNTAIN", "OPTIMIZE", "ORIGINAL", "POSTPONE", "PROPERTY", "PRISTINE", "PROPOSAL", "QUANTIFY", "REPUBLIC", "SOFTWARE", "SOLUTION", "STANDARD", "STRENGTH", "SQUIRREL", "TOMORROW", "VANQUISH", "ACCURACY", "MIDNIGHT", "UNIVERSE", "SENTENCE", "DISCOVER", "ASTEROID", "FAVORITE", "BACKFIRE", "HOSPITAL", "BUILDING", "CARRIAGE", "TIRAMISU", "CONTINUE", "CUSTOMER", "JUBILANT", "LANDLORD", "MACARONI", "MILITANT", "QUOTIENT", "LOCATION", "SABOTAGE", "PERSUADE", "CONFUSED", "REMEMBER", "TAILORED", "TALISMAN", "PROBABLY", "TANGIBLE", "ARGUMENT", "OBLIVION"]
}
