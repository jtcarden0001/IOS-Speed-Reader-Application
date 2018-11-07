//
//  SecondViewController.swift
//  Speed Reader Assignment4
//
//  Created by John Carden on 7/17/18.
//  Copyright © 2018 John Carden. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController, UITableViewDataSource{
    //var user: User!
    //var userDB: UserDB!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lastThreeScores1: UILabel!
    @IBOutlet weak var lastThreeScores2: UILabel!
    @IBOutlet weak var lastThreeScores3: UILabel!
    @IBOutlet weak var LTScount1: UILabel!
    @IBOutlet weak var LTScount2: UILabel!
    @IBOutlet weak var LTScount3: UILabel!
    @IBOutlet weak var cuurentUserLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        instance.userDB.userDBSort()
        tableView.reloadData()
        lastThreeScores1.text = "\(instance.currentUser.lastThreeSpeeds[0])"
        lastThreeScores2.text = "\(instance.currentUser.lastThreeSpeeds[1])"
        lastThreeScores3.text = "\(instance.currentUser.lastThreeSpeeds[2])"
        LTScount1.text = "\(instance.currentUser.lastThreeCounters[0])"
        LTScount2.text = "\(instance.currentUser.lastThreeCounters[1])"
        LTScount3.text = "\(instance.currentUser.lastThreeCounters[2])"
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Username: -> Top Speed"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return instance.userDB.count()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userIdentifier = "LeaderboardCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: userIdentifier, for: indexPath)
        let user = instance.userDB.userAtIndex(indexPath.row)
        cell.textLabel!.text = user.Username
        if user.ScoreHistory[0] == 1000.0{
            cell.detailTextLabel?.text = "N/A"
        }else{
            cell.detailTextLabel?.text = "\(user.ScoreHistory[0])"
        }
        return cell
    }
    
    
    
    
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.delegate = self
        self.tableView.dataSource = self
        cuurentUserLabel.text = "Current User Data: " + instance.currentUser.Username
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

