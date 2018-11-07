//
//  SettingsViewController.swift
//  Speed Reader Assignment4
//
//  Created by John Carden on 7/19/18.
//  Copyright © 2018 John Carden. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    //var user: User!
    //var userDB: UserDB!

    @IBOutlet weak var defaultUpdateLabel: UILabel!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var defaultSpeedField: UITextField!
    @IBOutlet weak var defaultCountdownField: UITextField!
    @IBAction func updateDefaults(_ sender: UIButton) {
        if inputErrorCheck(){
            errorMessage.isHidden = true
            instance.defaultCountdownDuration = Int(defaultCountdownField.text!)!
            instance.defaultTestSpeed = Double(defaultSpeedField.text!)!
            defaultUpdateLabel.isHidden = false
        }else{
            errorMessage.isHidden = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        defaultUpdateLabel.isHidden = true
        defaultSpeedField.text! = "\(instance.defaultTestSpeed)"
        defaultCountdownField.text! = "\(instance.defaultCountdownDuration)"
    }
    
    func inputErrorCheck() -> Bool{
        if let _ = Double(defaultSpeedField.text!){
            if let _ = Int(defaultCountdownField.text!){
                return true
            }
        }
        return false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessage.isHidden = true
        defaultUpdateLabel.isHidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let destinationViewController = segue.destination as! CreateUsernameViewController
        //destinationViewController.user = user
        //destinationViewController.userDB = userDB
        errorMessage.isHidden = true
        defaultSpeedField.text! = "\(instance.defaultTestSpeed)"
        defaultCountdownField.text! = "\(instance.defaultCountdownDuration)"
    }

}
