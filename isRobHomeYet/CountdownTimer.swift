//
//  CountdownTimer.swift
//  isRobHomeYet
//
//  Created by Ian Donovan on 7/25/15.
//  Copyright (c) 2015 Ian Donovan. All rights reserved.
//

import Foundation

struct CountdownTimer {
  let robsReturn: NSDate?

  init() {
    var formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    robsReturn = formatter.dateFromString("2015-09-08 09:00:00")
  }
  
  func secondsUntilRobComesHome() -> Int? {
    let currentDate = NSDate()
    if let interval = robsReturn?.timeIntervalSinceDate(currentDate) {
      return Int(interval)
    } else {
      return nil
    }
  }
  
  func getTimeDictionary(var seconds: Int) -> [String: Int] {
    let weeks = seconds / (60*60*24*7)
    seconds = seconds % (60*60*24*7)
    let days = seconds / (60*60*24)
    seconds = seconds % (60*60*24)
    let hours = seconds / (60*60)
    seconds = seconds % (60*60)
    let minutes = seconds / 60
    seconds = seconds % 60
    return [
      "weeks": weeks,
      "days": days,
      "hours": hours,
      "minutes": minutes,
      "seconds": seconds
    ]
  }
}