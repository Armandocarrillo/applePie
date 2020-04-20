//
//  ViewController.swift
//  applePie
//
//  Created by Armando Carrillo on 16/04/20.
//  Copyright © 2020 Armando Carrillo. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var listOfAnimals = ["caballo", "pez","perro","gatos","pajaro"]
    let incorrectMovesAllowed = 7
    var totalWins = 0
    var totalLose = 0
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
        let newWord = listOfAnimals.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
       updateUI()
        
    }
    func updateUI(){
        scoreLabel.text = "Wins: \(totalWins), Losses : \(totalLose) "
        treeImage.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())//convert the name of buttons (String) to Character
        currentGame.playerGuessed(letter: letter)
        updateUI()
    }
    
}

