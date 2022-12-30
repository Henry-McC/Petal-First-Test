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
    //@Published var round = 1
    
    var keyColors = [String: Color]()
    var selectedWord = ""
    var currentWord = ""
    var tryIndex = 0
    var inPlay = false
    var gameOver = false
    var toastWords = ["Awesome!"]
    var shuffledWord: Array<Character> = []
    var testWord = ""
    var round = 1
    var roundOver = false
    


    
    var gameStarted: Bool {
        !currentWord.isEmpty || tryIndex > 0
    }
    
    func roundText() -> String {
        return("Round: \(round)/5")
    }
    
    var disabledKeys: Bool {
        !inPlay || currentWord.count == 6
    }
    
    init() {
       // newGame()
       // shuffle()
        populateDefaults()
    }
    
    func startGame() {
        newGame()
        shuffle()
    }
    
    // Set Up
    func newGame() {
        populateDefaults()
        selectedWord = Global.commonWords.randomElement()!
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
        round += 1
        roundOver = false
        newGame()
        shuffle()
       // roundText()
        print(round)
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
            if round == 5 {
                print("game over")
            }
            print("Valid word")
            print(verifyLetters())
           // gameOver = true
            print("You Win")
            showToast(with: toastWords[0])
            roundOver = true
            print("wtf")
            inPlay = false
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
        let guessWord = currentWord.padding(toLength: 6, withPad: " ", startingAt: 0)
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
        withAnimation(Animation.linear(duration: 0.2).delay(3)) {
            toastText = nil
        }
    }
}
