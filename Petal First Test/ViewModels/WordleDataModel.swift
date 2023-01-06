//
//  WordleDataModel.swift
//  Petal First Test
//
//  Created by Henry A. McCreight on 11/12/22.
//

import SwiftUI

class WordleDataModel: ObservableObject {
    @Published var guesses: [Guess] = []
    @Published var incorrectAttempts = [Int](repeating: 0, count: 6)
    @Published var toastText: String?
    @Published var boardLength: Int = 5
    @Published var shouldHide = false
    @Published var userScore = 0
    @Published var highScore = 0
    
    var keyColors = [String: Color]()
    var selectedWord = ""
    var currentWord = ""
    var tryIndex = 0
    var inPlay = false
    var gameOver = false
    var toastWords = ["Awesome!", "Sweet!", "Nice!"]
    var shuffledWord: Array<Character> = []
    var testWord = ""
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
    }
    
    func startGame() {
        round = 1
        userScore = 0
        newGame()
        shuffle()
        shouldHide = true
    }
    
    // Set Up
    func newGame() {
        populateDefaults()
        if round < 3 {
            selectedWord = Global.commonWords.randomElement()!
        } else if round == 3 || round == 4 {
            selectedWord = Global.commonWords2.randomElement()!
        } else if round == 5 {
            selectedWord = Global.commonWords3.randomElement()!
        }
        currentWord = ""
        shuffledWord = selectedWord.shuffled()
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
        if round == 5 {
            gameOver = true
            if highScore < userScore {
                highScore = userScore
            }
            print("game over")
            showToast(with: "Game Over!")
            shouldHide = false
        } else {
            round += 1
            roundOver = false
            maxGuess()
            newGame()
            shuffle()
           // roundText()
            print(round)
        }
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
    
    
    
    func enterWord() {
        if verifyWord() && verifyLetters() {
            print("Valid word")
            print(verifyLetters())
           // gameOver = true
            print("You Win")
            roundOver = true
            userScore = (userScore + currentWord.count * 100)
            print("wtf")
            inPlay = false
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
}
