//
//  WordleDataModel.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 11/12/22.
//

import SwiftUI
import GoogleMobileAds



class WordleDataModel: ObservableObject {
    let defaults = UserDefaults.standard
    let adsVM = AdsViewModel.shared
   // @EnvironmentObject var adsVM: AdsViewModel

 
    
    
    @Published var guesses: [Guess] = []
    @Published var incorrectAttempts = [Int](repeating: 0, count: 6)
    @Published var toastText: String?
    @Published var boardLength: Int = 5
    @Published var shouldHide = false
    @Published var userScore = 0
    @Published var highScore = 0
    @Published var typedLetters: [Character] = []
    @Published var tapped = 0
    @Published var showStats = false
    @Published var showPause = false
    @Published var showOutOfTime = false
    @Published var showRound = false
    @Published var statsWords: Array<String> = []
    var addCount = 0
    let delaySeconds = 0.2
    
  //  @State var countDownTimer: Int = 5
  //  @State var timerRunning = true
  //  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
 /// Timer Data
   @Published var countDownTimer: Int = 20
   @Published var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    func startTimer() {
        timerRunning = true
        multiplierRunning = true
    }
    
    func endTimer() {
        timerRunning = false
        multiplierRunning = false
    }
    
    func addTime() {
        countDownTimer = countDownTimer + 15
    }
    
    func outOfTime() {
        //shuffledWord = Array(selectedWord)
        showOutOfTime.toggle()
        addCount += 1
        if addCount == 2 {
            adsVM.showInterstitial = true
            addCount = 0
        }
        gameOver = true
        inPlay = false
       // showRound = false
        showToast(with: "Out of Time!")
    //    shouldHide = false
    }
 ///
    
/// Multiplier Countdown
    
    @Published var multiplier: Double = 2.000
    @Published var multiplierRunning = true
    let multiplierTimer = Timer.publish(every: 0.082, on: .main, in: .common).autoconnect()

    
    @objc func startMultiplier() {
        
    }
///
    
    var keyColors = [String: Color]()
    var selectedWord = ""
    var currentWord = ""
    var tryIndex = 0
    var inPlay = false
    var gameOver = false
    var toastWords = ["Awesome!", "Sweet!", "Nice!"]
    var shuffledWord: Array<Character> = [" "]
    var testWord = " "
    var round = 1
    var roundOver = false
    
   // var gNumber: Int = 6
   // var gArray = [0, 1, 2, 3, 4, 5]

    
    var gameStarted: Bool {
        !currentWord.isEmpty || tryIndex > 0
    }
    
    func roundText() -> String {
        return("Round: \(round)/5")
    }
    
    
    var disabledKeys: Bool {
        if round < 3 {
           return !inPlay || currentWord.count == 6
        } else if round == 3 || round == 4 {
           return !inPlay || currentWord.count == 7
        } else if round == 5 {
           return !inPlay || currentWord.count == 8
        }
        return !inPlay
    }
    
    init() {
       // newGame()
       // shuffle()
       
        populateDefaults()
        inPlay = false
        highScore = defaults.integer(forKey: "HighScore")
    }
    
    func startGame() {
        statsWords = []
        round = 1
        userScore = 0
        countDownTimer = 20
        multiplier = 2.000
        maxGuess()
        startTimer()
        newGame()
        shuffle()
        showRound = true
        shouldHide = true
    }
    
    // Set Up
    func newGame() {
        populateDefaults()
        typedLetters = []
        if round < 3 {
            selectedWord = Global.commonWords.randomElement()!
        } else if round == 3 || round == 4 {
            selectedWord = Global.commonWords2.randomElement()!
        } else if round == 5 {
            selectedWord = Global.commonWords3.randomElement()!
        }
        currentWord = ""
        shuffledWord = selectedWord.shuffled()
        roundOver = false
        inPlay = true
        tryIndex = 0
        gameOver = false
        print(selectedWord)
        print(shuffledWord)
    }

    func shuffle() {
        testWord = String(shuffledWord)
    }
    
    func nextRound() {
            round += 1
            roundOver = false
            typedLetters = []
            maxGuess()
            newGame()
            shuffle()
            addTime()
            startTimer()
           // roundText()
            print(round)
        
    }
    

    
    func maxGuess() {
        if round < 3 {
            return boardLength = 5
        } else if round == 3 || round == 4 {
            return boardLength = 6
        } else if round == 5 {
            return boardLength = 7
        } else {
            return boardLength = 5
        }
    }
    
    
    func populateDefaults() {
        guesses = []
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
        
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        for char in letters {
            keyColors[String(char)] = .unused
        }
    }
    
    // Game Play
    func addToCurrentWord(_ letter: String) {
        currentWord += letter
        updateRow()
    }
    
    func addToTypedLetters(_ letter: Character) {
        typedLetters.append(letter)
        print(typedLetters)
    }
    
    
    
    
    func enterWord() {
        if currentWord == "RAPE" || currentWord == "RAPED" || currentWord == "RAPIST" {
            withAnimation {
                self.incorrectAttempts[tryIndex] += 1
            }
            showToast(with: "Not in word list.")
            incorrectAttempts[tryIndex] = 0
        } else if verifyWord() && verifyLetters() {
            statsWords.append(currentWord)
            userScore = (userScore + currentWord.count * 100)
            print(statsWords)
            if round == 5 {
                addCount += 1
                if addCount == 2 {
                    adsVM.showInterstitial = true
                    addCount = 0
                }
                roundOver = true
                gameOver = true
                userScore = Int(Double(userScore) * multiplier)
                if highScore < userScore {
                    highScore = userScore
                    defaults.set(userScore, forKey: "HighScore")
                }
                showStats.toggle()
                shuffledWord = [" "]
                showToast(with: "Game Over!")
                shouldHide = false
                showRound = false
            }
            endTimer()
            print(verifyLetters())
           // gameOver = true
            roundOver = true
            tapped += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + self.delaySeconds) {
                self.tapped = 0
            }
            inPlay = false
            shuffledWord = Array(selectedWord)
            showToast(with: toastWords.randomElement())
        }  else {
                withAnimation {
                    self.incorrectAttempts[tryIndex] += 1
                }
                showToast(with: "Not in word list.")
                incorrectAttempts[tryIndex] = 0
            }
        }
    

    func removeLetterFromCurrentWord() {
        currentWord.removeLast()
        updateRow()
    }
    
    func removeLetterFromTypedLetters() {
        typedLetters.removeLast()
    }

    
    func updateRow() {
        let guessWord = currentWord.padding(toLength: 8, withPad: " ", startingAt: 0)
        guesses[tryIndex].word = guessWord
    }
    
    func verifyWord() -> Bool {
        UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: currentWord)
    }
    
    func verifyLetters() -> Bool {
        var letters = selectedWord
        var good = true
        for letter in currentWord {
          if letters.contains(letter) {
            let idx = letters.firstIndex(of:letter)
            letters.remove(at: idx!)
          } else {
            good = false
            break
          }
        }
        print(letters)
        print(currentWord)
        return(good ? true : false)
    }
    
    func showToast(with text: String?) {
        withAnimation {
            toastText = text
        }
        withAnimation(Animation.linear(duration: 0.2).delay(1)) {
            toastText = nil
        }
    }
    
    func pauseGame() {
        if showPause {
            endTimer()
        }
    }
    
    func resumeGame() {
        startTimer()
    }
}
