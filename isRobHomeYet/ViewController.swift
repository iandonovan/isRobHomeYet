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
  @IBOutlet weak var yesOrNoImage: UIImageView!
  @IBOutlet weak var isRobLabel: UILabel?
  @IBOutlet weak var homeYetLabel: UILabel?
  @IBOutlet weak var countdownToRobLabel: UILabel?
  
  let countdown = CountdownTimer()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    yesOrNoImage.image = UIImage(named: "no.png")
    spaceOutLabelText(isRobLabel, fontSize: 20.0, fontName: "Monterrat-Bold")
    spaceOutLabelText(homeYetLabel, fontSize: 20.0, fontName: "Monterrat-Bold")
    spaceOutLabelText(countdownToRobLabel, fontSize: 12.0, fontName: "Roboto-Thin")
    var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("tick:"), userInfo: nil, repeats: true)
  }
  
  func tick(timer: NSTimer) {
    if let secondsUntilRob = countdown.secondsUntilRobComesHome() {
      if secondsUntilRob > 0 {
        let timeTuple = countdown.getTimeTuple(secondsUntilRob)
        putTimesInLabels(timeTuple)
      }
      else {
        yesOrNoImage.image = UIImage(named: "yes.png")
        secondsLabel?.text = "00"
        timer.invalidate()
      }
    }
  }
  
  func spaceOutLabelText(label: UILabel?, fontSize: CGFloat, fontName: String) {
    var font = UIFont(name: fontName, size: fontSize)
    if (font == nil) { font = UIFont.systemFontOfSize(fontSize) }
    let attributes: [String:AnyObject] = [
      NSKernAttributeName: NSNumber(float: Float(fontSize)),
      NSFontAttributeName: font!,
      NSForegroundColorAttributeName: UIColor.whiteColor()
    ]
    if let labelText = label?.text {
      let kernString = NSMutableAttributedString(string: labelText, attributes: attributes)
      label?.attributedText = kernString
    }
  }
  
  func putTimesInLabels(timeTuple: CountdownTimer.timeTuple) {
    weeksLabel?.text = String(format: "%02d", timeTuple.weeks)
    daysLabel?.text = String(format: "%02d", timeTuple.days)
    hoursLabel?.text = String(format: "%02d", timeTuple.hours)
    minutesLabel?.text = String(format: "%02d", timeTuple.minutes)
    secondsLabel?.text = String(format: "%02d", timeTuple.seconds)
  }
}

