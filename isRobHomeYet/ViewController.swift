//
//  ViewController.swift
//  isRobHomeYet
//
//  Created by Ian Donovan on 7/25/15.
//  Copyright (c) 2015 Ian Donovan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var weeksLabel: UILabel?
    @IBOutlet weak var daysLabel: UILabel?
    @IBOutlet weak var hoursLabel: UILabel?
    @IBOutlet weak var minutesLabel: UILabel?
    @IBOutlet weak var secondsLabel: UILabel?
    @IBOutlet weak var isRobLabel: UILabel!
    
    
  let countdown = CountdownTimer()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("tick:"), userInfo: nil, repeats: true)
    


  }
  
  func tick(timer: NSTimer) {
    if let secondsUntilRob = countdown.secondsUntilRobComesHome() {
      if secondsUntilRob > 0 {
        let timeDictionary = countdown.getTimeDictionary(secondsUntilRob)
        putTimesInLabels(timeDictionary)
      }
      else {
        //yesOrNoLabel?.text = "YES"
        secondsLabel?.text = "00"
        timer.invalidate()
      }
    }
  }
  
  func putTimesInLabels(timeDictionary: [String: Int]) {
    if let weeksLeft = timeDictionary["weeks"] {
      weeksLabel?.text = String(format: "%02d", weeksLeft)
    }
    if let daysLeft = timeDictionary["days"] {
      daysLabel?.text = String(format: "%02d", daysLeft)
    }
    if let hoursLeft = timeDictionary["hours"] {
      hoursLabel?.text = String(format: "%02d", hoursLeft)
    }
    if let minutesLeft = timeDictionary["minutes"] {
      minutesLabel?.text = String(format: "%02d", minutesLeft)
    }
    if let secondsLeft = timeDictionary["seconds"] {
      secondsLabel?.text = String(format: "%02d", secondsLeft)
    }
  }
}

