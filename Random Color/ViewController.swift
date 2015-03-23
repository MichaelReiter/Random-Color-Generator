//
//  ViewController.swift
//  Random Color Picker
//
//  Created by Michael Reiter on 2015-03-10.
//  Copyright (c) 2015 Michael Reiter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buttonPressed(nil)
        
        colorLabel.frame = CGRectMake(0, self.view.frame.size.height/8, self.view.frame.size.width/2, 100)
        colorLabel.textAlignment = .Center
        colorLabel.textColor = UIColor.whiteColor()
        colorLabel.backgroundColor = UIColor.clearColor()
        colorLabel.font = UIFont(name: "Avenir", size: 50)
        colorLabel.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height)
        self.view.addSubview(colorLabel!)
        
        let buttonWidth: CGFloat = 120
        let buttonHeight: CGFloat = buttonWidth/2

        let button = MyButton(frame: CGRectMake(self.view.frame.size.width/2 - buttonWidth/2, self.view.frame.size.height/4*3 - buttonHeight/2, buttonWidth, buttonHeight))
        button.titleLabel?.font = UIFont(name: "Avenir", size: buttonHeight/3)
        button.setTitle("RANDOM", forState: .Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.whiteColor().CGColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func buttonPressed(sender: UIButton!) {
        
        let redInt = arc4random_uniform(255)
        let greenInt = arc4random_uniform(255)
        let blueInt = arc4random_uniform(255)
        
        var redHexValue = NSString(format:"%2X", redInt) as String
        var greenHexValue = NSString(format:"%2X", greenInt) as String
        var blueHexValue = NSString(format:"%2X", blueInt) as String
        if (redInt >= 0 && redInt <= 15) {
            redHexValue = "0" + dropFirst(redHexValue)
        }
        if (greenInt >= 0 && greenInt <= 15) {
            greenHexValue = "0" + dropFirst(greenHexValue)
        }
        if (blueInt >= 0 && blueInt <= 15) {
            blueHexValue = "0" + dropFirst(blueHexValue)
        }

        self.view.backgroundColor = UIColor(red: CGFloat(redInt)/255, green: CGFloat(greenInt)/255, blue: CGFloat(blueInt)/255, alpha: 1)
        
        self.colorLabel.text = "#" + redHexValue + greenHexValue + blueHexValue
    }
}

class MyButton : UIButton {
    
    override var highlighted: Bool {
        get {
            return super.highlighted
        }
        set {
            if newValue {
                backgroundColor = UIColor.whiteColor()
                setTitleColor(self.superview?.backgroundColor, forState: .Highlighted)
            }
            else {
                backgroundColor = UIColor.clearColor()
            }
            super.highlighted = newValue
        }
    }
}
