//
//  FirstViewController.swift
//  Speed Reader Assignment4
//
//  Created by John Carden on 7/17/18.
//  Copyright © 2018 John Carden. All rights reserved.
//

import UIKit

class SpeedTestViewController: UIViewController {
    //var user: User!
    //var userDB: UserDB!
    var countdownInt = instance.defaultCountdownDuration
    var currentWord = 0
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var currentWordLabel: UILabel!
    @IBOutlet weak var wpmEntryField: UITextField!
    @IBOutlet weak var testCountdown: UILabel!
    var timer = Timer()
    var timer1 = Timer()
    var parArray = instance.testParagraph.components(separatedBy: " ")
    
    @IBOutlet weak var errorMessage: UILabel!
    
    @objc func decrementCountdown(){
        if countdownInt > 0{
            testCountdown.text = "Beginning in: \(countdownInt)"
            countdownInt -= 1
        }else{
            //countdownInt = instance.defaultCountdownDuration
            testCountdown.isHidden = true
            timer.invalidate()
            timer1 = Timer.scheduledTimer(timeInterval: 1/(Double(wpmEntryField.text!)!/60)
            , target: self,
                    selector:#selector(SpeedTestViewController.showWord),
                    userInfo: nil, repeats: true)
            RunLoop.main.add(timer1, forMode: RunLoopMode.defaultRunLoopMode)
            timer1.fire()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        wpmEntryField.text! = "\(instance.defaultTestSpeed)"
        haltTest()
    }
    
    @objc func showWord(){
        if currentWord < parArray.count{
            currentWordLabel.text = parArray[currentWord]
            let myMutableString = NSMutableAttributedString(string:currentWordLabel.text!)
            // change the color attribute
            myMutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.red, range: NSRange(location:parArray[currentWord].characters.count/2, length:1))
            currentWordLabel.attributedText = myMutableString
            currentWord += 1
        }else{
            currentWord = 0
            currentWordLabel.text = "Challenge Complete!"
            instance.currentUser.addToScoreHistory(Double(wpmEntryField.text!)!)
            //print(instance.currentUser.ScoreHistory[0])
            timer1.invalidate()
            
        }
    }
    
    func haltTest(){
        testCountdown.isHidden = true
        timer.invalidate()
        currentWordLabel.text = ""
        timer1.invalidate()
        currentWord = 0
        countdownInt = instance.defaultCountdownDuration
    }
    
    @IBAction func stopTest(_ sender: UIButton) {
        haltTest()
    }
    
    
    @IBAction func startTestAction(_ sender: UIButton) {
        haltTest()
        countdownInt = instance.defaultCountdownDuration
        currentWordLabel.text = ""
        if let _ = Double(wpmEntryField.text!){
            errorMessage.isHidden = true
            testCountdown.isHidden = false
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self,
                selector: #selector(SpeedTestViewController.decrementCountdown),
                userInfo: nil, repeats: true)
            RunLoop.main.add(timer, forMode: RunLoopMode.defaultRunLoopMode)
            timer.fire()
        }else{
            errorMessage.isHidden = false
        }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = "Username: " + instance.currentUser.Username
        currentWordLabel.text = ""
        testCountdown.isHidden = true
        errorMessage.isHidden = true
        wpmEntryField.text! = "\((1/instance.defaultTestSpeed) * 60)"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

