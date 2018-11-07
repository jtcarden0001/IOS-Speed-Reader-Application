//
//  User.swift
//  Speed Reader Assignment4
//
//  Created by John Carden on 7/19/18.
//  Copyright © 2018 John Carden. All rights reserved.
//

import Foundation

class User{
    let Username:String
    var ScoreHistory:[Double]
    var lastThreeSpeeds:[Double]
    var lastThreeCounters:[Int]
    
    init(_ username: String){
        Username = username
        ScoreHistory = [1000.0]
        lastThreeSpeeds = [0.0,0.0,0.0]
        lastThreeCounters = [0,0,0]
    }
    
    func addToScoreHistory(_ score:Double){
        if ScoreHistory[0] == 1000.0{
            ScoreHistory[0] = score
        }else{
            ScoreHistory.append(score)
        }
        ScoreHistory = ScoreHistory.sorted(by:>)
        if lastThreeSpeeds[0] == score{
                lastThreeCounters[0] += 1
                return
            }
        lastThreeSpeeds[2] = lastThreeSpeeds[1]
        lastThreeSpeeds[1] = lastThreeSpeeds[0]
        lastThreeCounters[2] = lastThreeCounters[1]
        lastThreeCounters[1] = lastThreeCounters[0]
        
        lastThreeSpeeds[0] = score
        lastThreeCounters[0] = 1
        }
//        lastThreeSpeeds.append(score)
//        for i in (0..<lastThreeSpeeds.count-1){
//            lastThreeSpeeds[i+1] = lastThreeSpeeds[i]
//        }
//        lastThreeSpeeds[0] = score
//        for i in (0..<lastThreeCounters.count-1){
//            lastThreeCounters[i+1] = lastThreeCounters[i]
//        }
//        lastThreeCounters[0] = 1
//    }
    
    
}
