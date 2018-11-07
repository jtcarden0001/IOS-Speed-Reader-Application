//
//  UserDB.swift
//  Speed Reader Assignment4
//
//  Created by John Carden on 7/19/18.
//  Copyright © 2018 John Carden. All rights reserved.
//

import Foundation

class UserDB{
    var userDatabase: [User]
    var userLocation: Int!
    
    init (){
        userDatabase = [User]()
    }
    
    func addUser(_ username: String){
        let user = User(username)
        userDatabase.append(user)
        userDBSort()
        for i in (0..<userDatabase.count){
            if userDatabase[i].Username == username{
                userLocation = i
            }
        }
        }
    func userDBSort(){
        userDatabase = userDatabase.sorted(by: { $0.ScoreHistory[0] > $1.ScoreHistory[0] })
    }

    func duplicateCheck(_ username: String) -> Bool{
        for i in userDatabase{
            if i.Username == username{
                return false
            }
        }
        return true
    }
    
    func reselectUser(_ username: String){
        for i in (0..<userDatabase.count){
            if userDatabase[i].Username == username{
                userLocation = i
            }
        }
    }
    
    func userAtIndex(_ idx: Int) -> User{
        return userDatabase[idx]
    }
    
    func count() -> Int{
        return userDatabase.count
    }
}
