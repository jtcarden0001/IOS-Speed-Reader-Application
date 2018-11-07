//
//  CreateUsernameViewController.swift
//  Speed Reader Assignment4
//
//  Created by John Carden on 7/19/18.
//  Copyright © 2018 John Carden. All rights reserved.
//

import UIKit

class CreateUsernameViewController: UIViewController {

    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var usernameField: UITextField!
    var segueCheck = false
    
    @IBAction func beginAction(_ sender: UIButton) {
        //if let _ = userDB{
        if usernameField.text! == ""{
            errorMessage.isHidden = false
            segueCheck = false
        }else{
            if instance.userDB.duplicateCheck(usernameField.text!){
                instance.userDB.addUser(usernameField.text!)
                instance.currentUser = instance.userDB.userDatabase[instance.userDB.userLocation]
                errorMessage.isHidden = true
                segueCheck = true
            }else{
                    instance.userDB.reselectUser(usernameField.text!)
                    instance.currentUser = instance.userDB.userDatabase[instance.userDB.userLocation]
                    segueCheck = true
            }}
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessage.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return segueCheck
    }
    @IBAction func segueDidUnwindFromSettingsVC(_ Sender:UIStoryboardSegue){
        let _ = Sender.source as! SettingsViewController
        usernameField.text! = ""
    }

}
