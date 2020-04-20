//
//  ViewController.swift
//  applePie
//
//  Created by Armando Carrillo on 16/04/20.
//  Copyright © 2020 Armando Carrillo. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var listOfAnimals = ["caballo","pez","perro","gatos","pajaro"]
    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet{
            newRound()
        }
    }
    var totalLose = 0 {
        didSet {
            newRound()
        }
    }
    var currentGame: Game!
    
    @IBOutlet var treeImage: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]! // outlet collection
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    newRound()
    }
   
    
    
    
    
    func newRound(){
        if !listOfAnimals.isEmpty{
        let newWord = listOfAnimals.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
       enableLetterButton(true)
            updateUI()
        }else {
            enableLetterButton(false)
        }
        
    }
    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formattedWord{
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses : \(totalLose) "
        treeImage.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())//convert the name of buttons (String) to Character
        currentGame.playerGuessed(letter: letter)
        //updateUI()
        updateGameState()
    }
    func updateGameState(){
        if currentGame.incorrectMovesRemaining == 0{
            totalLose += 1
        }else if currentGame.word == currentGame.formattedWord{
            totalWins += 1
        } else {
            updateUI()
        }
    }
    func enableLetterButton(_ enable : Bool){
        for button in letterButtons{
            button.isEnabled = enable
        }
        
    }
}

