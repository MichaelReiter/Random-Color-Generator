//
//  ViewController.swift
//  Phone Finder
//
//  Created by Michael Reiter on 2015-03-10.
//  Copyright (c) 2015 Michael Reiter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buttonPressed(nil)
        
        let labelHeight: CGFloat = 100
        let label = UILabel(frame: CGRectMake(0, 0, self.view.frame.size.width, labelHeight))
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        label.backgroundColor = UIColor.clearColor()
        label.text = "COLOR"
        label.font = UIFont(name: "Avenir", size: 50)
        label.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/3 - labelHeight/2)
        self.view.addSubview(label)
        
        let buttonWidth: CGFloat = 120
        let buttonHeight: CGFloat = buttonWidth/2

        let button = MyButton(frame: CGRectMake(self.view.frame.size.width/2 - buttonWidth/2, self.view.frame.size.height/3*2 - buttonHeight/2, buttonWidth, buttonHeight))
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
    
    @IBAction func buttonPressed(sender: UIButton!) {
    
        let redHexValue = String(arc4random_uniform(255), radix: 16, uppercase: true)
        let greenHexValue = String(arc4random_uniform(255), radix: 16, uppercase: true)
        let blueHexValue = String(arc4random_uniform(255), radix: 16, uppercase: true)
        let hexString = "#" + redHexValue + greenHexValue + blueHexValue
        NSLog("%@", hexString)
        
        
        let red = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let green = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let blue = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        
        self.view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
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
