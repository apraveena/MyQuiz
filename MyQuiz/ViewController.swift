//
//  ViewController.swift
//  MyQuiz
//
//  Created by Spur IQ on 7/12/19.
//  Copyright © 2019 Praveena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var validationLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var shouldRevealSwitch: UISwitch!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var ansSwitchName: UISwitch!
    @IBAction func checkButtonClicked(_ sender: Any) {
        checkData()
    }
    
    var restart = false
    var currentQNum : Int = 1
    var score : Int = 0
    var revealAnswers = true
    
    var questions = ["What loses its head in the morning and gets it back in the night?",
                     "What is the capital of California",
                     "Who was the first president of United States",
                     "You will buy me to eat but never eat me. What am I"]
    var answers = ["Pillow",
                   "Sacramento",
                   "George Washington",
                   "Plate"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateUI()
    }

    @IBAction func enterButtonPressed(_ sender: Any) {
        checkData()
    }
    
    func updateUI(){
        if (currentQNum > 0 && currentQNum < questions.count+1) {
            questionLabel.text = questions[currentQNum-1]
            answerTextField.text = ""
           
        } else {
            var msg = ""
            if (score > questions.count/2){
                msg = "Well done. Click restart to play the game again."
            } else {
                msg = "There is room for improvement. Take a deep breath, try again."
            }
            questionLabel.text = msg
            validationLabel.text = ""
            answerTextField.text = ""
            checkButton.setTitle("Restart", for: .normal)
            answerTextField.isEnabled = false
            
            restart = true
        }
        scoreLabel.text = "Score: \(score)"
    }
    
    func resetScreen(){
        restart = false
        currentQNum = 1
        answerTextField.text = ""
        validationLabel.text = ""
        scoreLabel.text = ""
        score = 0
        answerTextField.isEnabled = true
        updateUI()
    }
    
    func checkData(){
        if(restart == true) {
            resetScreen()
            return
        }
        
        if(answerTextField.text == ""){
            return;
        }
        
        let currAns = answers[currentQNum-1]
        let userAns = answerTextField.text
        if (currAns.caseInsensitiveCompare(userAns!) == .orderedSame){
            validationLabel.text = "Correct"
            score += 1
        } else {
            if(shouldRevealSwitch.isOn) {
                validationLabel.text = "Incorrect. Correct answer is: \(answers[currentQNum-1])"}
            else {
                validationLabel.text = "Incorrect"
            }
        }
//        progressBar.frame.size.width = (view.frame.size.width / 3) * CGFloat(currentQNum)
        currentQNum += 1
        updateUI()
    }
    
    @IBOutlet weak var revealAnswersLabel: UILabel!
    @IBAction func answerSwitch(_ sender: Any) {
        if(ansSwitchName.isOn){
            revealAnswersLabel.text = "Reveal answers if I got it wrong: On"
        }
        else {
            revealAnswersLabel.text = "Reveal answers if I got it wrong: Off"
        }
    }
    
    
}

