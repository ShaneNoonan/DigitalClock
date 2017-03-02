//
//  ViewController.swift
//  DigitalClock
//
//  Created by Shane Noonan on 02/02/2017.
//  Copyright © 2017 Shane Noonan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var backgroundView: UIView!
    @IBOutlet var label: UILabel!
    @IBOutlet var settingsView: UIView!
    @IBOutlet var colourSegment: UISegmentedControl!
    @IBOutlet var backColourSegment: UISegmentedControl!
    @IBOutlet var settingsButton: UIButton!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        
        settingsView.isHidden = true
        settingsButton.alpha = 0.25
        label.alpha = 0
        
        settingsView.layer.cornerRadius = 10
        settingsButton.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateTimer() {
        
        let timeFormatter = DateFormatter()
        
        timeFormatter.timeStyle = .medium
        label.text = timeFormatter.string(from: Date())
        label.alpha = 1
        
        
    }

    @IBAction func settingsB(_ sender: Any) {
        
        if settingsView.isHidden == true {
            
            settingsView.isHidden = false
            settingsButton.setTitle("Hide Settings", for: [])
            settingsButton.alpha = 1
        }
        else {
            
            settingsView.isHidden = true
            settingsButton.setTitle("Show Settings", for: [])
            settingsButton.alpha = 0.25
        }
        
    }
    
    @IBAction func textColour(_ sender: Any) {
        if colourSegment.selectedSegmentIndex == 0 {
            label.textColor = UIColor.white
        }
        else if colourSegment.selectedSegmentIndex == 1 {
            label.textColor = UIColor.red
        }
        else if colourSegment.selectedSegmentIndex == 2 {
            label.textColor = UIColor.yellow
        }
        else if colourSegment.selectedSegmentIndex == 3 {
            label.textColor = UIColor.blue
        }
    }
    
    @IBAction func backgroundColour(_ sender: Any) {
        if backColourSegment.selectedSegmentIndex == 0 {
            backgroundView.backgroundColor = UIColor.black
        }
        else if backColourSegment.selectedSegmentIndex == 1 {
            backgroundView.backgroundColor = UIColor.green
        }
        else if backColourSegment.selectedSegmentIndex == 2 {
            backgroundView.backgroundColor = UIColor.magenta
        }
        else if backColourSegment.selectedSegmentIndex == 3 {
            backgroundView.backgroundColor = UIColor.purple
        }
        
    }
}

