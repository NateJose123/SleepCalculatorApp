//
//  SleepAppViewController.swift
//  Sleep Calculator
//
//  Created by Nathan Jose on 1/10/20.
//  Copyright © 2020 Nathan Jose. All rights reserved.
//

import UIKit


class SleepAppViewController: UIViewController {
    
    @IBOutlet weak var firstCycleClock: UILabel!
    @IBOutlet weak var secondCycleClock: UILabel!
    @IBOutlet weak var thirdCycleClock: UILabel!
    @IBOutlet weak var fourthCycleClock: UILabel!
    @IBOutlet weak var fifthCycleClock: UILabel!
    @IBOutlet weak var sixthCycleClock: UILabel!

    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
        firstCycleClock.layer.cornerRadius = 4.0
        firstCycleClock.layer.masksToBounds = true
        secondCycleClock.layer.cornerRadius = 4.0
        secondCycleClock.layer.masksToBounds = true
        thirdCycleClock.layer.cornerRadius = 4.0
        thirdCycleClock.layer.masksToBounds = true
        fourthCycleClock.layer.cornerRadius = 4.0
        fourthCycleClock.layer.masksToBounds = true
        fifthCycleClock.layer.cornerRadius = 4.0
        fifthCycleClock.layer.masksToBounds = true
        sixthCycleClock.layer.cornerRadius = 4.0
        sixthCycleClock.layer.masksToBounds = true

    }
   
     @objc func tick() {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "h:mm"
        let dateString = formatter.string(from: Date())
        
        var time = dateString.split(separator: ":")
        print(time[0])
        
        formatter.dateFormat = "a"
        let newDataString = formatter.string(from: Date())
        let hours = Int(time[0])
        let minutes = Int(time[1])
        var firstCycleClockTimeH = hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 105, cycle: 1, ampm: newDataString)
        var secondCycleClockTimeH = hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 195, cycle: 2, ampm: newDataString)
        var thirdCycleClockTimeH = hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 285, cycle: 3, ampm: newDataString)
        var fourthCycleClockTimeH = hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 375, cycle: 4, ampm: newDataString)
        var fifthCycleClockTimeH = hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 465, cycle: 5, ampm: newDataString)
        var sixthCycleClockTimeH = hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 555, cycle: 6, ampm: newDataString)
        

}
    func hoursTimeCalc(hours: Int, minutes: Int, timetoadd: Int, cycle: Int, ampm: String) {
        var newMinutes = timetoadd+minutes
        var newHours = hours+(newMinutes/60)
        if newMinutes>59 {
            newMinutes = newMinutes%60
        }
        var newAmpm = ""
        if newHours>=12 {
            newHours = newHours - 12
            if newHours==0 {
                newHours = 12
            }
            if ampm == "AM"{
                newAmpm = "PM"
            }
            else {
                newAmpm = "AM"
            }
        }
        else {
            newAmpm = "PM"
        }
        if cycle==1 {
            firstCycleClock.text = "\(newHours):\(newMinutes) \(newAmpm)"
        }
        if cycle==2 {
                   secondCycleClock.text = "\(newHours):\(newMinutes) \(newAmpm)"
               }
        if cycle==3 {
                   thirdCycleClock.text = "\(newHours):\(newMinutes) \(newAmpm)"
               }
        if cycle==4 {
                   fourthCycleClock.text = "\(newHours):\(newMinutes) \(newAmpm)"
               }
        if cycle==5 {
                   fifthCycleClock.text = "\(newHours):\(newMinutes) \(newAmpm)"
               }
        if cycle==6 {
                   sixthCycleClock.text = "\(newHours):\(newMinutes) \(newAmpm)"
               }
    }
}

